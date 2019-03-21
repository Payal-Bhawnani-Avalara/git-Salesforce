function initializeMagellanController() {
  setActiveNav('Lead Workflow', dashboardSidebar, 'rc-nav', 'magellan-nav');
  // setActiveNav('Lead Workflow', magellanSidebar, 'magellan-nav');


  selectNode = function (node) {
    $(".paper-scroller, .paper").css("background","#999999");
    var newImage;
    _.each(graph.getElements(),function(n){
      if ((n instanceof Magellan.Models.Node) && n.id != node.id) {
        if (n instanceof Magellan.Models.ActionNode) {
          newImage = iconToURLMap["Action Node"];
        } else if (n instanceof Magellan.Models.TriggerNode) {
          newImage = iconToURLMap["Trigger Node"];
        } else if (n instanceof Magellan.Models.DecisionNode) {
          newImage = iconToURLMap["Decision Node"];
        } else if (n instanceof Magellan.Models.MatchNode) {
          newImage = iconToURLMap["Match Node"];
        }
        n.prop("attrs/image.main-icon", {href: newImage});
      }
    });

    _.each(graph.getLinks(), function(l){
      if (l.get("source").id === node.id) {
        l.label(0,{attrs: {text: {fill: "#FFFFFF"}}});
        l.prop("attrs/.connection",{stroke: '#FFFFFF'});
        l.prop("attrs/.labels rect",{fill: "rgba(255,255,255,0)"});

        // '.labels rect' : {fill: "rgba(255,255,255,1)"},
      } else {
        l.prop("attrs/.labels rect",{fill: "rgba(255,255,255,0)"});
      }
    });

    // if (n instanceof Magellan.Models.ActionNode) {
    //   newImage = iconToURLMap["Action Node Opaque"];
    // } else if (n instanceof Magellan.Models.TriggerNode) {
    //   newImage = iconToURLMap["Trigger Node Opaque"];
    // } else if (n instanceof Magellan.Models.DecisionNode) {
    //   newImage = iconToURLMap["Decision Node Opaque"];
    // } else if (n instanceof Magellan.Models.MatchNode) {
    //   newImage = iconToURLMap["Match No de Opaque"];
    // }
    // var outgoingLinks = graph.getConnectedLinks(node, { outbound: true });
    // _.each(outgoingLinks, function(link){
    //   link.label(0,{attrs: {text: {fill: "#FFFFFF"}}});
    //   link.prop("attrs/.connection",{stroke: '#FFFFFF'});
    // });

    // node.prop("attrs/image.main-icon", {href: newImage});
  };

  unselectNode = function () {
    $(".paper-scroller, .paper").css("background","#FFFFFF");
    var newImage;
    _.each(graph.getElements(),function(n){
      if ((n instanceof Magellan.Models.Node)) {
        if (n instanceof Magellan.Models.ActionNode) {
          newImage = iconToURLMap["Action Node Opaque"];
        } else if (n instanceof Magellan.Models.TriggerNode) {
          newImage = iconToURLMap["Trigger Node Opaque"];
        } else if (n instanceof Magellan.Models.DecisionNode) {
          newImage = iconToURLMap["Decision Node Opaque"];
        } else if (n instanceof Magellan.Models.MatchNode) {
          newImage = iconToURLMap["Match Node Opaque"];
        }
        n.prop("attrs/image.main-icon", {href: newImage});
      }
    });

    _.each(graph.getLinks(), function(l){
      l.label(0,{attrs: {text: {fill: "#555555"}}});
      l.prop("attrs/.connection",{stroke: '#6a6c8a'});
      l.prop("attrs/.labels rect",{fill: "rgba(255,255,255,1)"});
    });




    // var newImage;
    // if (n instanceof Magellan.Models.ActionNode) {
    //   newImage = iconToURLMap["Action Node"];
    // } else if (n instanceof Magellan.Models.TriggerNode) {
    //   newImage = iconToURLMap["Trigger Node"];
    // } else if (n instanceof Magellan.Models.DecisionNode) {
    //   newImage = iconToURLMap["Decision Node"];
    // } else if (n instanceof Magellan.Models.MatchNode) {
    //   newImage = iconToURLMap["Match Node"];
    // }
    // var outgoingLinks = graph.getConnectedLinks(node, { outbound: true });
    // _.each(outgoingLinks, function(link){
    //   link.label(0,{attrs: {text: {fill: "#555555"}}});
    //   link.prop("attrs/.connection",{stroke: '#6a6c8a'});
    // });

    // node.prop("attrs/image.main-icon", {href: newImage});
  };

  setTriggerNodesOnGraph = function () {

    var textWrapperProperties = {
      markup: '<g><text class="dummy-text-box"><tspan class="dummy-tspan"/></text></g>',
      position: {x: 0,y: 0},
      attrs: {
        'text.dummy-text-box' : {'fill': '#555555',
          'font-family': 'open-sans-light',
          'font-size': '10px', 
          'font-weight': '400',
          'opacity' : '0'
        },
      }
    };
    var newTextEl = new joint.shapes.basic.Generic(textWrapperProperties);
    newTextEl.addTo(graph);

    var properties =  {
      id: '',
      position: {x: 550, y: 0},
      attrs: {
        size: {width: 100, height: 75}
      }
    };
    var el = new Magellan.Models.TriggerNode(properties);
    
    el.addNodeInfo("New Lead");
    
    el.addTo(graph);
    el.resyncNodeInfoAndPresentation({"createLink" : {"Next Node" : true} });


    properties["position"] = {x: 330, y: 0};
    el = new Magellan.Models.TriggerNode(properties);
    el.nodeType = "UPDATE TRIGGER";

    el.addNodeInfo("Updated Lead");
    
    el.addTo(graph);
    el.resyncNodeInfoAndPresentation({"createLink" : {"Next Node" : true} });
  }

  graph = new joint.dia.Graph;

  var $app = $('#paper');

  $('#viewLabels').change(function(){
    if($(this).is(":checked"))
      $("#paper").addClass("show-labels");
    else
      $("#paper").removeClass("show-labels");
  });

  $('.toggle-action-nodes').hover(function(){
      $("#action-node-container").css("visibility","visible");
      $("#action-node-stencil .StencilElement").attr("display","block");
    },
    function(){
      $("#action-node-container").css("visibility","hidden");
      $("#action-node-stencil .StencilElement").attr("display","none");
    }
  );

  // $('.toggle-action-nodes').click(function(){
  //   if($("#action-node-container").css("visibility") === "hidden"){
  //     $("#action-node-container").css("visibility","visible");
  //     $("#action-node-stencil .StencilElement").attr("display","block");
  //   } else {
  //      $("#action-node-container").css("visibility","hidden");
  //      $("#action-node-stencil .StencilElement").attr("display","none");
  //    }
  // });

  function getLinkConnectionPoint(link, node, arg, arg2) {

    return node.model.getLinkConnectionPoint(link,node,arg);
  }

  paper = new joint.dia.Paper({
    width: 1548,
    height: 1805,
    model: graph,
    gridSize: 1,
    linkPinning: true,
    markAvailable: true,
    // linkConnectionPoint: joint.util.shapePerimeterConnectionPoint,
    linkConnectionPoint: getLinkConnectionPoint,
    defaultLink: new Magellan.Models.DefaultLink(),
    interactive: {vertexAdd: false }   
  });
    
  
  paperScroller = new joint.ui.PaperScroller({
    autoResizePaper: true,
    padding: 0,
    paper: paper
  });
  
  paperScroller.$el.css({
    width: 1048,
    height: 836
  });
  
  
  $app.append(paperScroller.render().el);
  paper.on('blank:pointerdown', function(evt) {
    if (!evt.shiftKey) paperScroller.startPanning(evt);
  });
  
  var stencil = new joint.ui.Stencil({ 
    graph: graph,
    paper: paper,
    width: 100,
    height: 350,
    dropAnimation: {
      duration: 300,
      easing: 'linear'
    }
            
  });

  testStencil = new joint.ui.Stencil({
    graph: graph,
    paper: paper,
    width: 200,
    height: 361,
    dropAnimation: {
      duration: 300,
      easing: 'linear'
    }
  });

    

  $('#node-group-stencil').append(stencil.render().el);

  $("#action-node-stencil").append(testStencil.render().el);
  
        
  function createModal(title, content) {
    return new joint.ui.Dialog({
      type: 'alert',
      width: 400,
      title: title,
      content: content
    });
  }
    
                
    // SELECTION
        
        
  var selection = new Backbone.Collection;
  var selectionView = new joint.ui.SelectionView({ paper: paper, graph: graph, model: selection });
      
  // Initiate panning when the user grabs the blank area of the paper.
  paper.on('blank:pointerdown', function(evt) {
    if (evt.shiftKey) selectionView.startSelecting(evt);
  });

  
  selectionView.on('selection-box:pointerup', function(evt) {
    _.each(selection.models, function(cellView) {
      var pos = cellView.get('position');
      if(pos != undefined){
        var p1 = { x: g.snapToGrid(pos.x, 110), y:      g.snapToGrid(pos.y, 60) };

        cellView.set('position', p1);
      }
    });
  });
              
  paper.on('cell:pointerup', function(cellView) {
  
    var pos = cellView.model.get('position');
    if(pos != undefined){
      var p1 = { x: g.snapToGrid(pos.x, 110), y: g.snapToGrid(pos.y, 60) };
  
      cellView.model.set('position', p1);
    }
  }); 
      
  // clipboard
  
  var clipboard = new joint.ui.Clipboard;
  keyboardJS.on('ctrl + c', function() {
  clipboard.copyElements(selection, graph); });
  keyboardJS.on('ctrl + v', function() { clipboard.pasteCells(graph); });
    
    
  //Nathan's notes:  I have commented out default jointjs validation logic
  //


  //this is jointjs's history object.  it keeps track of some stuff we 
  //care about such as changing a cell's position
  commandManager = new joint.dia.CommandManager({ graph: graph });
  
    
  
  // check whether an element being placed on empty paper
  // function clear(err, command, next) {
  
    
  //   var t = command.data.attributes || graph.getCell(command.data.id).toJSON()
  //     if(graph.getCell(t.id) instanceof Magellan.Models.StencilElement) {
  //     return next(err);
  //   } else if (graph.getCell(t.id) instanceof Magellan.Models.DefaultLink){
  //     return;
  //   }
  
  //   var area = g.rect(t.position.x, t.position.y, t.size.width, t.size.height);
  
  //   var cellsOverlap = _.find(graph.getElements(), function (e) {
  //     var position = e.get('position');
  //     var size = e.get('size');
  //     return (!(graph.getCell(e.id) instanceof Magellan.Models.StencilElement) && e.id !== t.id && area.intersect(g.rect(position.x, position.y, size.width, size.height)));
  //   });

  //   if (cellsOverlap) return next("Movement causes cells to overlap.");
  //   return next(err);
  // };
  
  // function belowParent(err, command, next) {
  
  //   var t = command.data.attributes || graph.getCell(command.data.id).toJSON();
  //   var el = graph.getCell(t.id);
    
  //   var aboveParent = _.find(graph.getElements(), function (e) {
  //     return (graph.isSuccessor(e, el) && (el.attributes.position.y <= e.attributes.position.y));
  //   });

  //   if (aboveParent) return next("Child node has to be below parent."); 
          
  //   return next(err);
  // }
  
  // function aboveChildren(err, command, next) {
  
  //   var t = command.data.attributes || graph.getCell(command.data.id).toJSON();
  //   var el = graph.getCell(t.id);
    
  //   var belowChild = _.find(graph.getElements(), function (e) {
  //     return (graph.isSuccessor(el, e) && (el.attributes.position.y >= e.attributes.position.y));
  //   });

  //   if (belowChild) return next("Parent node has to be above children.");
      
  //   return next(err);
  // }
  
  $.fn.extend({
    stencilize: function(stencil) {
      var newStencils = [];
      this.each(function(){
        var x = this.offsetLeft;
        var y = this.offsetTop;
        var modelKeys = this.dataset.stencilmodel.split(".")
        var constructor = window;
        for (var i = 0; i < modelKeys.length; i++)
          constructor = constructor[modelKeys[i]];
        var newStencil = new constructor({position: {x: x, y: y}});
        newStencils.push(newStencil);
        this.dataset.stencilId = newStencil.id;
      });
      stencil.load(newStencils);

      return(this);
    }
  });

  // graph.on("change:position", function(cell,collection,opt){
  //   // alert('yo homey!');
  //   var aboveParent = _.find(graph.getElements(), function (e) {
  //     return (graph.isSuccessor(e, cell) && (cell.attributes.position.y <= e.attributes.position.y));
  //   });

  //   if (aboveParent){
  //     // debugger;
  //     // commandManager.undo();
  //     createModal('Child position invalid', "Child node has to be below parent.").open();
  //   }
  // });

  graph.on('add', function(cell, collection, opt) {
    if (opt.stencil && cell instanceof Magellan.Models.StencilElement) {
      var bbox = cell.getBBox();
      var snappedPosition = { x: g.snapToGrid(cell.position().x, 110), y: g.snapToGrid(cell.position().y, 75) };
      var properties =  {
        id: '',
        position: {x: snappedPosition.x, y: snappedPosition.y},
        attrs: {
          rect: { fill: cell.attributes.elAttrs.fill, 'stroke': cell.attributes.elAttrs.stroke, 'stroke-width': 4, 'fill-opacity':0.5, rx: 5, ry: 5 },
          originalProps: {fill: cell.attributes.elAttrs.fill, 'stroke': cell.attributes.elAttrs.stroke},
          size: {width: 100, height: 75}
        }
      }
      var el;

      //rewrite this garbage code;
      var createLinks = {};
      switch(cell.attributes.shapeClass){
        case "ActionNode":
          var modelKeys = cell.get("nodeModel").split(".")
          var constructor = window;
          for (var i = 0; i < modelKeys.length; i++)
            constructor = constructor[modelKeys[i]];
          el = new constructor(properties);
          el.addNodeInfo();
          break;
        case "DecisionNode":
          el = new Magellan.Models.DecisionNode(properties);
          el.addNodeInfo();
          break;
        case "MatchNode":
          el = new Magellan.Models.MatchNode(properties);
          el.addNodeInfo();
          createLinks["createLink"] = {"No Match" : true, "Match Found" : true};
          break;
      }

      el.addTo(graph);
      el.resyncNodeInfoAndPresentation(createLinks);
      setTimeout(function(cell){cell.remove(); }, 0, cell);
    } else if(cell instanceof joint.dia.Link){
      cell.set('source', {id: cell.getSourceElement().id, selector: 'rect'});
      cell.getSourceElement().toFront();
      
        
      cell.on('change:source', function() {
        if(cell.getSourceElement() != null) {
          cell.set('source', {id: cell.getSourceElement().id, selector: 'rect'}); 
          cell.getSourceElement().toFront();
        }

      });
      cell.on('change:target', function() {
        if(cell.getTargetElement() != null) {
          cell.set('target', {id: cell.getTargetElement().id});
        }
      });
        
      cell.getSourceElement().toFront();
    }
  });
    
  paper.$el.on('mousewheel DOMMouseScroll', onMouseWheel);
  
  function onMouseWheel(e) {
    if (!e.ctrlKey) {return;}
      
    e.preventDefault();
    if(e.originalEvent.wheelDelta >= 120) {
      paperScroller.zoom(0.05, { max: 1.5 });
    } else if(e.originalEvent.wheelDelta <= -120) { 
      paperScroller.zoom(-0.05, { min: 0.4});
   }
     //$('.paper-scroller').css('padding','none');
  }
  
  var inspector;

  function populateInspector(cellView) {
    var nodeView = new Magellan.Views.NodeForm({model: cellView.model});
    var nodeConfigurator = nodeView.render().$el;
    $('#properties-wrapper').html(nodeConfigurator);
  }

  inspectorUp = false;
  inspectedEl = null;

  clickX = null;
  clickY = null;

  paper.on('cell:pointerdown', function(cellView,evt,x,y){
    clickX = x;
    clickY = y;
  });

  // stencil.on('cell:mouseover', function(cellView){
  //   if (!(cellView.model instanceof Magellan.Models.StencilElement)) return;
  //   $("#node-group-container li, #action-node-container li").addClass("hover");
  // });

  // stencil.on('cell:mouseout', function(cellView){
  //   if (!(cellView.model instanceof Magellan.Models.StencilElement)) return;
  //   $("#node-group-container li, #action-node-container li").removeClass("hover");
  // });

  paper.on('cell:pointerup', function(cellView, evt, x, y) {  
    if (evt.which == 1 && evt.shiftKey) {
      if(clickX == x && clickY == y  && cellView.model instanceof Magellan.Models.Node && !(cellView.model instanceof Magellan.Models.TriggerNode )) {
        var inboundLinks = graph.getConnectedLinks(cellView.model, { inbound: true });
        var nodePosition = cellView.model.getAbsoluteCenter();
        _.each(inboundLinks, function(l){
          l.set('target',{x: nodePosition.x, y: nodePosition.y});
        });
        graph.removeLinks(cellView.model);
        cellView.remove();   
      }
    } else if (evt.which == 1)  {
      if(!inspectedEl && clickX == x && clickY == y  && cellView.model instanceof Magellan.Models.Node) {
        // inspectedEl = cellView;
        var position =  cellView.model.get('position');
        var relativeCenter = cellView.model.get('linkConnection');
        inspectorUp = true;
        populateInspector(cellView);
        $('#inspector').animate({'right': '-525px'}, 'slow');
        $(".hide-on-inspect").hide();
        $(".hide-after-inspect").show();
        selectNode(cellView.model);
        var paperOffset = $("#paper").offset();
        var paperSVGOffset = $("#paper svg").offset();
        var leftOffset = position.x + relativeCenter.x - 260 - (paperOffset.left - paperSVGOffset.left);
        var topOffset = position.y + relativeCenter.y - 260 - (paperOffset.top - paperSVGOffset.top);

        // var leftOffset = position.x - (170.0 - (relativeCenter.x * 2))/2 - 260;// + paperOffset.left;
        // var topOffset = position.y - (170.0 - (relativeCenter.y * 2))/2 - 400;// + paperOffset.top;

        // $("#paper").animate({"left": "-" + leftOffset + "px", "top": "-" +topOffset + "px"}, "slow");
        paperScroller.center(position.x + 280,position.y + 250);

        setTimeout(function(cellView){inspectedEl = cellView;}, 10, cellView);
      }     
    } 
  });


  //unsure of the wisdom of this not selector.....
  // $(":not(#inspector *)").click(function(evt){
  //   if(inspectorUp && this.id != "inspector") {
  //     if(inspectedEl != null) {
  //       //TODO: abstract this hiding animating stuff to a dedicated method
  //       // $("#paper-overlay").hide();
        
  //       // setTimeout(function(){paperScroller.center(paperScroller._center.x,paperScroller._center.y);},1);
  //       paperScroller.center(paperScroller._center.x,paperScroller._center.y);
  //       unselectNode(inspectedEl.model);
  //       $('#inspector').animate({'right': '-1045px'}, 'slow', "swing", function(){$(".hide-on-inspect").show();$(".hide-after-inspect").hide();});
  //       inspectorUp = false;

  //       if (inspectedEl.model instanceof joint.dia.Link) {
  //         inspectedEl.model.attr('.connection/stroke',      inspectedEl.model.attr('originalProps').stroke);
  //       }
  //       inspectedEl = null;
  //     } 
  //   }
  // });

  $("#paper-wrapper").click(function(evt){
    if(inspectorUp) {
      if(inspectedEl != null) {
        //TODO: abstract this hiding animating stuff to a dedicated method
        // $("#paper-overlay").hide();
        
        // setTimeout(function(){paperScroller.center(paperScroller._center.x,paperScroller._center.y);},1);
        paperScroller.center(paperScroller._center.x,paperScroller._center.y);
        unselectNode(inspectedEl.model);
        $('#inspector').animate({'right': '-1045px'}, 'slow', "swing", function(){$(".hide-on-inspect").show();$(".hide-after-inspect").hide();});
        inspectorUp = false;

        if (inspectedEl.model instanceof joint.dia.Link) {
          inspectedEl.model.attr('.connection/stroke',      inspectedEl.model.attr('originalProps').stroke);
        }
        inspectedEl = null;
      } 
    }
  });


  paper.on('blank:pointerdown', function(evt) {
    if(inspectorUp) {
    // if(evt.shiftKey && inspectorUp) {
      if(inspectedEl != null) {
        //TODO: abstract this hiding animating stuff to a dedicated method
        paperScroller.center(paperScroller._center.x,paperScroller._center.y);
        unselectNode(inspectedEl.model);
        $('#inspector').animate({'right': '-1045px'}, 'slow', "swing", function(){$(".hide-on-inspect").show();$(".hide-after-inspect").hide();});
        inspectorUp = false;
        
        if (inspectedEl.model instanceof joint.dia.Link) {
          inspectedEl.model.attr('.connection/stroke',      inspectedEl.model.attr('originalProps').stroke);
        }
        inspectedEl = null;
      } 
    }
  });
  
  var cellMouseIn = null;
  var mouseOutTimer = null;
  paper.on('cell:mouseout', function(cellView, evt) { 
    if (cellView.model instanceof joint.dia.Link) return;
    mouseOutTimer = setTimeout(mouseOut, 200, cellView);
  });
    
  function mouseOut(cellView) {
    var successors = graph.getSuccessors(cellView.model);
    successors.push(cellView.model);
    _.each(successors, function(successor) { 
      var outgoingLinks = graph.getConnectedLinks(successor, { outbound: true });
    });

    
    cellMouseIn = null;
   }
  
  
  // COMMAND MANAGER
  keyboardJS.on('ctrl + z', function() {
  commandManager.undo();});
  
  
  keyboardJS.on('ctrl + shift + z', function() {
  commandManager.redo();});

  $('#toggleNodeCreator').click(function() {
    if($("#stencil-parent").css('visibility') == 'hidden') {
      $("#stencil-parent").css("visibility", "visible");
    } else {
      $("#stencil-parent").css("visibility", "hidden");
      $("#action-node-container").css("visibility", "hidden");
    }
    var actionNodesDropdown = new Magellan.Views.ActionNodeDropdown();
    var ActionNodeDropdownHTML = actionNodesDropdown.render().$el;
    $('#action-node-dropdown').html(ActionNodeDropdownHTML);

    $('.dynamic-stencil').stencilize(testStencil);
    
    $('.dynamic-stencil-2').stencilize(stencil);

    //should rewrite this
    $(".StencilElement").mouseenter(function(e){
      var id = e.currentTarget.getAttribute("model-id");
      $('[data-stencil-id="' + id + '"]').closest("li").addClass("hover");
    });

    $(".StencilElement").mouseleave(function(e){
      var id = e.currentTarget.getAttribute("model-id");
      $('[data-stencil-id="' + id + '"]').closest("li").removeClass("hover");
    });
    $("#action-node-stencil .StencilElement").attr("display","none");


  });
  
  
  // HOLDING PEN
  
  

  graph.on('add', function(cell) {
    if(!(cell instanceof joint.dia.Link)) {

    } else {
      cell.toBack();
    }
  });
      
}
