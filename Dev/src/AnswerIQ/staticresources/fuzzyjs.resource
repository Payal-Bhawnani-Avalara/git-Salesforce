       // Thanks to https://github.com/mattyork/fuzzy
// Some tweaks to the match algorithm.

(function() {

var root = this;

var fuzzy = {};

// Use in node or in browser
if (typeof exports !== 'undefined') {
  module.exports = fuzzy;
} else {
  root.fuzzy = fuzzy;
}

// Return all elements of `array` that have a fuzzy
// match against `pattern`.
fuzzy.simpleFilter = function(pattern, array) {
  return array.filter(function(string) {
    return fuzzy.test(pattern, string);
  });
};

// Does `pattern` fuzzy match `string`?
fuzzy.test = function(pattern, string) {
  return fuzzy.match(pattern, string) !== null;
};

// If `pattern` matches `string`, wrap each matching character
// in `opts.pre` and `opts.post`. If no match, return null
fuzzy.match = function(searches, string, opts) {
  opts = opts || {};
  var pre = opts.pre || ''
    , post = opts.post || '';

  var results = _.map(searches, function(s) {
    var res = string.match(s);
    if (!res) {
      return null;
    }
    return {
      start: res.index,
      end: res.index + res[0].length,
      length: res[0].length,
      contents: res[0]
    };
  });
//alert(JSON.stringify(results))
  if (!_.every(results)) {
    return null;
  }

  results = _.sortBy(results, 'start');
  var accum = "";
  var score = 0;
  var prev_end = 0;
  var result;
  for (var i=0; i<results.length; i++) {
    result = results[i];
      if (result.start < prev_end) {
          //return null;
      }else{
          accum += string.substr(prev_end, result.start - prev_end);
          accum += pre + result.contents + post;
          if (i === 0) {
              score -= (result.start - prev_end) * 0.01;
          } else {
              score -= Math.pow((result.start - prev_end), 2);
          }
          if (result.start > 0 && string[result.start - 1] === " ") { score += 200; }
          if (result.end < string.length - 1 && string[result.end] === " ") { score += 200; }
          prev_end = result.end;
      }
    
  }
  accum += string.substr(prev_end);

  return {rendered: accum, score: score};
};

// The normal entry point. Filters `arr` for matches against `pattern`.
// It returns an array with matching values of the type:
//
//     [{
//         string:   '<b>lah' // The rendered string
//       , index:    2        // The index of the element in `arr`
//       , original: 'blah'   // The original element in `arr`
//     }]
//
// `opts` is an optional argument bag. Details:
//
//    opts = {
//        // string to put before a matching character
//        pre:     '<b>'
//
//        // string to put after matching character
//      , post:    '</b>'
//
//        // Optional function. Input is an entry in the given arr`,
//        // output should be the string to test `pattern` against.
//        // In this example, if `arr = [{crying: 'koala'}]` we would return
//        // 'koala'.
//      , extract: function(arg) { return arg.crying; }
//    }

fuzzy.filter = function(pattern, arr, opts) {
  opts = opts || {};
  pattern = pattern.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
  var searches = pattern.trim(" ").split(" ");
  searches = _.map(searches, function(s) {return new RegExp(s, 'i');});
  return arr
    .reduce(function(prev, element, idx, arr) {
      var str = element;
      if(opts.extract) {
        str = opts.extract(element);
      }
       
      var rendered = fuzzy.match(searches, str, opts);
      if(rendered != null) {
        prev[prev.length] = {
            string: rendered.rendered
          , score: rendered.score
          , index: idx
          , original: element
        };
      }
        
      return prev;
    }, [])

    // Sort by score. Browsers are inconsistent wrt stable/unstable
    // sorting, so force stable by using the index in the case of tie.
    // See http://ofb.net/~sethml/is-sort-stable.html
    .sort(function(a,b) {
      var compare = b.score - a.score;
      if(compare) return compare;
      return a.index - b.index;
    });
};

}());
