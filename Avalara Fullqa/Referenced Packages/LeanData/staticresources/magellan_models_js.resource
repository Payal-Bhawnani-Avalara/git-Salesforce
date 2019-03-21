function initializeMagellanModels () {
  if (typeof Magellan === "undefined")
    Magellan = {};

  if (typeof Magellan.Models === "undefined")   
    Magellan.Models = {};


  joint.dia.Graph.prototype.flattenedGraph = function() {
    var nodeInfoArray = [];
    _.each(graph.getElements(), function(node){
      if (!(node instanceof Magellan.Models.Node)) return;
      nodeInfoArray.push([node.id,node.nodeInfo]);
    });
    return nodeInfoArray;
  };

  //Link Model
  Magellan.Models.DefaultLink = joint.shapes.defaultMagellanLink = joint.dia.Link.extend({
    defaults: joint.util.deepSupplement({
      type: 'defaultMagellanLink',
      attrs: {
        '.labels rect' : {fill: "rgba(255,255,255,1)"},
        '.link-tools' : {display: 'none'},
        '.marker-arrowhead' : {opacity: 0},
        '.marker-arrowhead-group-target .marker-arrowhead' : {d: "M 26 0 L 0 13 L 80 26 80 0 z"},
        '.connection': { stroke: '#6a6c8a', 'stroke-width': 1 },                      
        originalProps: {stroke: '#6a6c8a'},
      }, 
      labels: [
        {position: .5, attrs: { text: {fill: '#555555', 'font-size': '10px', 'font-weight': 400, 'font-family': 'open-sans-light', x: 30, y: 0} }}
      ]
    }, joint.dia.Link.defaults)
  });

  Magellan.Models.DefaultLink.prototype.getLinkSlope = function () {
    var sourcePosition = this.getSourceElement() ? this.getSourceElement().get("position") : this.get("source");
    var targetPosition = this.getTargetElement() ? this.getTargetElement().get("position") : this.get("target");
    var rise = 0.0 + targetPosition.y - sourcePosition.y;
    var run = 0.0 + sourcePosition.x - sourcePosition.x;
    return rise/run;
  };

  //Generic Stencil, never instantiated
  Magellan.Models.StencilElement = joint.shapes.basic.Image.extend({    
    defaults: joint.util.deepSupplement({
      size: { width: 35, height: 35 },
      elAttrs: {fill: '#A6A3FF', stroke: '#A6A3FF'},
      type: 'basic.Image.StencilElement',
      attrs: {
        'rect': { rx: 10, ry: 10,  width: 50, height: 50 },
        image: {height: 35, width: 35, x: 0, y: 0}
      }
    }, joint.shapes.basic.Image.prototype.defaults)
  });

  //Stencils
  Magellan.Models.DecisionNodeStencil = Magellan.Models.StencilElement.extend({
    defaults: joint.util.deepSupplement({
      // type: 'basic.Image.DecisionNodeStencil',
      shapeClass: "DecisionNode",
      attrs: { 
        image: { 'xlink:href': iconToURLMap["Decision Node Icon"]}
      }
    }, Magellan.Models.StencilElement.prototype.defaults)
  });

  Magellan.Models.MatchNodeStencil = Magellan.Models.StencilElement.extend({
    defaults: joint.util.deepSupplement({
      shapeClass: "MatchNode",
      attrs: { 
        image: {'xlink:href': iconToURLMap["Match Node Icon"]}
      }
    }, Magellan.Models.StencilElement.prototype.defaults)
  });

  //Action node stencil is never instantiated,
  //there is no generic action node (white chicken problem)
  Magellan.Models.ActionNodeStencil = Magellan.Models.StencilElement.extend({
    defaults: joint.util.deepSupplement({
      shapeClass: "ActionNode",
      attrs: { 
        image: { 'xlink:href': iconToURLMap["Action Node Icon"]}
      }
    }, Magellan.Models.StencilElement.prototype.defaults)
  });

  Magellan.Models.AssignOwnerAccountStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Assign Owner Account",
      stencilModel: "Magellan.Models.AssignOwnerAccountStencil",
      nodeModel: "Magellan.Models.AssignOwnerAccount",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.AssignOwnerLeadStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Assign Owner Lead",
      stencilModel: "Magellan.Models.AssignOwnerLeadStencil",
      nodeModel: "Magellan.Models.AssignOwnerLead",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.AssignOwnerOpportunityStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Assign Owner Opportunity",
      stencilModel: "Magellan.Models.AssignOwnerOpportunityStencil",
      nodeModel: "Magellan.Models.AssignOwnerOpportunity",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.AssignmentRuleStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Assignment Rule",
      stencilModel: "Magellan.Models.AssignmentRuleStencil",
      nodeModel: "Magellan.Models.AssignmentRule",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.ConvertStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Convert",
      stencilModel: "Magellan.Models.ConvertStencil",
      nodeModel: "Magellan.Models.Convert",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.CreateAccountStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Create Account",
      stencilModel: "Magellan.Models.CreateAccountStencil",
      nodeModel: "Magellan.Models.CreateAccount",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.MergeStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Merge",
      stencilModel: "Magellan.Models.MergeStencil",
      nodeModel: "Magellan.Models.Merge",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.RoundRobinStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Round Robin",
      stencilModel: "Magellan.Models.RoundRobinStencil",
      nodeModel: "Magellan.Models.RoundRobin",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.Lead2AccountTagStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Lead2Account Tag",
      stencilModel: "Magellan.Models.Lead2AccountTagStencil",
      nodeModel: "Magellan.Models.Lead2AccountTag",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.UpdateLeadStencil = Magellan.Models.ActionNodeStencil.extend({
    defaults: joint.util.deepSupplement({
      dropdownLabel: "Update Lead",
      stencilModel: "Magellan.Models.UpdateLeadStencil",
      nodeModel: "Magellan.Models.UpdateLead",
    }, Magellan.Models.ActionNodeStencil.prototype.defaults)
  });

  Magellan.Models.Edge = function(model, linkId, name, type, editable) {
    this.modelId = model.id;
    this.linkId = linkId;
    this.name = name;
    this.type = type;
    this.editable = editable;
  };

  Magellan.Models.Node = joint.shapes.basic.Generic.Node = joint.shapes.basic.Generic.extend({
    markup:'<g><image class="main-icon"/><image class="auxiliary-icon"/><text class="node-name-text-box"><tspan class="object-hat"/><tspan class="line-1"/><tspan class="line-2"/><tspan class="line-3"/></text></g>',
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.Node',
      attrs: {
        'image.main-icon': { x: 0, y: 0, opacity: 1},
        'image.auxiliary-icon': {display: 'none'},
        'text.node-name-text-box' : {'fill': '#555555',
          'text-shadow': '1px 0 0 lightgray',
          'text-anchor': 'middle',
          'font-family': 'open-sans-light',
          'display' : 'block',
          'font-size': '10px', 
          'font-weight': '400'
        },
        'tspan.object-hat' : {display: 'none', fill: "#000000", 'font-weight': '600'},
        'tspan.line-1' : {x: 38, y: 20},
        'tspan.line-2' : {x: 38, y: 32},
        'tspan.line-3' : {x: 38, y: 44}
      }
    }, joint.shapes.basic.Generic.prototype.defaults)
  });

  Magellan.Models.Node.prototype.renderName = function () {
    var wrappedText = joint.util.breakText(this.nodeInfo.name, {
        width: 65,
        height: 50
      });
      this.attr(".node-name-text-box/text", wrappedText);
      if(this.nodeInfo && this.nodeInfo.objectType) this.attr(".object-hat/text", this.nodeInfo.objectType);
  };

  Magellan.Models.Node.prototype.renderName2 = function () {
    //alternatives to this method of text-wrapping
    //are unpreferable, and don't support zooming
    //"foreign object" and directly imposing the html
    //on z-axis on top are often recommended for such
    //such text-wrapping uses, but this is preferable

    //we will simulate the SVG element to get pixel length
    //we need to actually render the text, I inserted a dummy,
    //0 opacity text tag

    var dummyTspan = document.getElementsByClassName("dummy-tspan")[0];

    // an elipsis ("...") has a length of about 7.1
    // we need to see that we have that much length remaining

    var words = this.nodeInfo.name.split(" ");
    var lines = ["","",""];
    var lineLength = 65;
    var lineNum = 0;
    

    //will have to rewrite
    for (var i = 0; i < words.length; i++) {
      var word = words[i];

      dummyTspan.innerHTML = lines[lineNum];
      var startingLength = dummyTspan.getComputedTextLength();
      dummyTspan.innerHTML = " " + word;
      var wordLength = dummyTspan.getComputedTextLength();

      if (startingLength + wordLength < 65 && 
          ((lineNum != 2) ||(65 - startingLength - wordLength <= 7.2) || (i === words.length))) {
        lines[lineNum] += " " + word;
      } else if (lineNum === 2 && (65 - startingLength) > 7.2) {
        lines[lineNum] += "...";
        break;
      } else if ((startingLength + wordLength) >= 65) {
        i--;
        lineNum++;
      } 

      if (wordLength > 65 && i != 0 && lineNum != 2) {
        lines[lineNum + 1] += "...";
        break;
      } else if (wordLength > 65 && i === 0) {
        lines[0] = "..."
      }

      if (lineNum > 2) break;
    }

    this.attr(".line-1/text", lines[0]);
    this.attr(".line-2/text", lines[1]);
    this.attr(".line-3/text", lines[2]);
    if(this.nodeInfo && this.nodeInfo.objectType) this.attr(".object-hat/text", this.nodeInfo.objectType);
  };

  Magellan.Models.Node.prototype.getAbsoluteCenter = function () {
    var topCornerPosition = this.position();
    var relativeCenter = this.get("linkConnection");
    return g.point(topCornerPosition.x + relativeCenter.x, topCornerPosition.y + relativeCenter.y);
  };

  Magellan.Models.Node.prototype.getLinkConnectionPoint = function () {
    return this.getAbsoluteCenter();
  };

  Magellan.Models.NodeView = joint.dia.ElementView;
  
  Magellan.Models.Node.prototype.resyncNodeInfoAndPresentation = function (params) {
    params = params || {};
    this.renderName();
    // this.set('label',this.nodeInfo.name);

    //this angle code is utter garbage, change

    var angleEdges = this.nodeInfo.edges.length > 1;
    var that = this;
    _.each(this.nodeInfo.edges, function(edge,idx) {
      if (!params["createLink"] && !params["destroyLink"]) return false;
      if (params["createLink"] && params["createLink"][edge.name]) {
        var edgeNum = angleEdges ? idx : null;
        var newLink = graph.getCell(edge.modelId).getNextLink(edge.name,edgeNum);
        //new link highlighted
        if (inspectorUp) {
          newLink.label(0,{attrs: {text: {fill: "#FFFFFF"}}});
          newLink.prop("attrs/.connection",{stroke: '#FFFFFF'});
          newLink.prop("attrs/.labels rect",{fill: "rgba(255,255,255,0)"});
        }
        graph.addCell(newLink);
        edge.linkId = newLink.id;
        if (that.nodeInfo.type === "UPDATE TRIGGER") {
          that.prop("attrs/image.main-icon", {"xlink:ref": iconToURLMap["Trigger Node Opaque"]});
        }
      } else if (params["destroyLink"] && params["destroyLink"][edge.name]) {
        graph.getCell(edge.linkId).remove();
        edge.linkId = null;
      }
    });
    if (params["deleteLink"]) {
      graph.getCell(params["deleteLink"]).remove();
    }
    if (params["renameLink"]) {
      var link = graph.getCell(params["renameLink"].linkId);
      //using this method re-renders the link with new name
      //otherwise it will change in the object but not rerender
      link.label(0, {attrs: {text: {text: params["renameLink"].name}}})
    }

    if (params["renderForm"]) {
      var nodeView = new Magellan.Views.NodeForm({model: this});
      var nodeConfigurator = nodeView.render().$el;
      $('#properties-wrapper').html(nodeConfigurator);
    }

    this.toFront();
  };

  Magellan.Models.Node.prototype.addNodeInfo = function (customName) {
    var nodeInfo = {
      type: this.nodeType,
      name: customName || this.get('label'),
      edges: [
        new Magellan.Models.Edge(this, null, "Yes", "Yes", false), 
        new Magellan.Models.Edge(this, null, "No", "No", false)
      ]
    };
    this.nodeInfo = nodeInfo;
  };

  Magellan.Models.MatchNode = joint.shapes.basic.Generic.MatchNode = Magellan.Models.Node.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.MatchNode',
      labelClass: "match-node-label",
      linkConnection: {x: 56, y: 43},
      attrs: {
        label: 'Match Node',
        'image.main-icon': { 'xlink:href': iconToURLMap["Match Node Opaque"], height: 82, width: 86, x: 15},
        'tspan.object-hat' : {display: 'block', x: 58, y: 18},
        'text.node-name-text-box' : {x: 58, y: 36},
        'tspan.line-1' : {x: 58, y: 36},
        'tspan.line-2' : {x: 58, y: 48},
        'tspan.line-3' : {x: 58, y: 60}
      }
    },  Magellan.Models.Node.prototype.defaults)
  });

  Magellan.Models.MatchNode.prototype.nodeType = "MATCH";

  Magellan.Models.MatchNode.prototype.addNodeInfo = function(customName) {
    var nodeInfo = {
      type: this.nodeType,
      name: customName || "Match Node",
      edges: [
        new Magellan.Models.Edge(this, null, "No Match", "No Match", false),
        new Magellan.Models.Edge(this, null, "Match Found", "Match Found", false)
      ]
    };
    this.nodeInfo = nodeInfo;
  };

  Magellan.Models.TriggerNode = joint.shapes.basic.Generic.TriggerNode =  Magellan.Models.Node.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.TriggerNode',
      labelClass: "trigger-node-label",
      linkConnection: {x: 56, y: 38},
      attrs: {
        label: 'Trigger',
        'image.main-icon': { 'xlink:href': iconToURLMap["Trigger Node Opaque"], height: 76, width: 77, x: 18},
        'text.node-name-text-box' : {x: 56, y: 20},
        'tspan.line-1' : {x: 56, y: 20},
        'tspan.line-2' : {x: 56, y: 32},
        'tspan.line-3' : {x: 56, y: 44}
      }
    }, Magellan.Models.Node.prototype.defaults)
  });

  joint.shapes.basic.Image.TriggerNode = Magellan.Models.TriggerNode;

  Magellan.Models.TriggerNode.prototype.nodeType = "TRIGGER";

  Magellan.Models.TriggerNode.prototype.addNodeInfo = function(customName) {
    var nodeInfo = {
      type: this.nodeType,
      name: customName || "Trigger Node",
      edges: [
        new Magellan.Models.Edge(this, null, "Next Node", "Next Node", false) 
      ]
    };
    this.nodeInfo = nodeInfo;
  };


  Magellan.Models.ActionNode = joint.shapes.basic.Generic.ActionNode =  Magellan.Models.Node.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.ActionNode',
      labelClass: "action-node-label",
      linkConnection: {x: 56,y: 25},
      attrs: {
        'image.main-icon' : { 'xlink:href': iconToURLMap["Action Node Opaque"], height: 57, width: 124, x: 1},
        'image.auxiliary-icon': {display: 'block', height: 35, width: 35, x: 75, y: 42},
        'text.node-name-text-box' : {x: 63, y: 20},
        'tspan.line-1' : {x: 63, y: 20},
        'tspan.line-2' : {x: 63, y: 32},
        'tspan.line-3' : {x: 63, y: 44}
      }
    }, Magellan.Models.Node.prototype.defaults)
  });

  Magellan.Models.ActionNode.prototype.nodeType = "ACTION";

  Magellan.Models.ActionNode.prototype.addNodeInfo = function(customName) {
    var nodeInfo = {
      type: this.nodeType,
      name: customName || "Action Node",
      edges: []
    };
    this.nodeInfo = nodeInfo;
  };

  Magellan.Models.AssignOwnerAccount = joint.shapes.basic.Generic.AssignOwnerAccount =  Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.AssignOwnerAccount',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Assign Owner Account"]},
        label: 'Assign Owner'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.AssignOwnerLead = joint.shapes.basic.Generic.AssignOwnerLead = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.AssignOwnerLead',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Assign Owner Lead"]},
        label: 'Assign Owner'
      },
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.AssignOwnerOpportunity = joint.shapes.basic.Generic.AssignOwnerOpportunity = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.AssignOwnerOpportunity',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Assign Owner Opportunity"]},
        label: 'Assign Owner'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.AssignmentRule = joint.shapes.basic.Generic.AssignmentRule = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.AssignmentRule',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Assignment Rule"]},
        label: 'Assignment Rule'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.Convert = joint.shapes.basic.Generic.Convert = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.Convert',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Convert"]},
        label: 'Convert'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.CreateAccount = joint.shapes.basic.Generic.CreateAccount = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.CreateAccount',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap[ "Create Account"]},
        label: 'Create Account'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.Merge = joint.shapes.basic.Generic.Merge = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.Merge',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Merge"]},
        label: 'Merge'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.RoundRobin = joint.shapes.basic.Generic.RoundRobin = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.RoundRobin',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Round Robin"]},
        label: 'Round Robin'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.Lead2AccountTag = joint.shapes.basic.Generic.Lead2AccountTag = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.Lead2AccountTag',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Lead2Account Tag"]},
        label: 'Lead2Account Tag'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  Magellan.Models.UpdateLead = joint.shapes.basic.Generic.UpdateLead = Magellan.Models.ActionNode.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.UpdateLead',
      attrs: {
        'image.auxiliary-icon': { 'xlink:href': iconToURLMap["Update Lead"]},
        label: 'Update Lead'
      }
    }, Magellan.Models.ActionNode.prototype.defaults)
  });

  //removing update lead stencil
  Magellan.Models.ActionNode.getActionNodeStencils = function() {
    return [new Magellan.Models.AssignOwnerAccountStencil(), 
      new Magellan.Models.AssignOwnerLeadStencil(),
      new Magellan.Models.AssignOwnerOpportunityStencil(),
      new Magellan.Models.AssignmentRuleStencil(),
      new Magellan.Models.ConvertStencil(),
      new Magellan.Models.CreateAccountStencil(),
      new Magellan.Models.MergeStencil(),
      new Magellan.Models.RoundRobinStencil(),
      new Magellan.Models.Lead2AccountTagStencil()
    ];
  }


  Magellan.Models.DecisionNode = joint.shapes.basic.Generic.DecisionNode = Magellan.Models.Node.extend({
    defaults: joint.util.deepSupplement({
      type: 'basic.Generic.DecisionNode',
      // type: 'basic.DecisionNode',
      linkConnection: {x: 56, y: 42},
      labelClass: "decision-node-label",
      attrs: {
        label: 'Decision Node',
        'image.main-icon': { 'xlink:href': iconToURLMap["Decision Node Opaque"], width: 113, height: 85},
        'tspan.object-hat' : {display: 'block', x: 56, y: 18},
        'text.node-name-text-box' : {x: 56, y: 32},
        'tspan.line-1' : {x: 56, y: 32},
        'tspan.line-2' : {x: 56, y: 44},
        'tspan.line-3' : {x: 56, y: 56}
      }
    }, Magellan.Models.Node.prototype.defaults)
  });

  Magellan.Models.DecisionNode.prototype.nodeType = "DECISION";

  Magellan.Models.DecisionNode.prototype.addNodeInfo = function(customName) {
    var nodeInfo = {
      type: this.nodeType,
      name: customName || "Decision Node",
      edges: []
    };
    this.nodeInfo = nodeInfo;
  };

  Magellan.Models.Node.prototype.getNextLink = function(edgeName,idx) {
    var topCornerPosition = this.position();
    var relativeCenter = this.get("linkConnection");
    var offSet = 0;
    if (idx === 0) offSet = -85;
    if (idx === 1) offSet = 85;
    var targetYCoordinate = topCornerPosition.y + relativeCenter.y + 150;
    var targetXCoordinate = topCornerPosition.x + relativeCenter.x + offSet;
    var newLink = new Magellan.Models.DefaultLink();
    newLink.get('labels')[0].attrs.text.text = edgeName;
    newLink.set('source',{id: this.id, selector: "rect"});
    newLink.set('target',{x: targetXCoordinate, y: targetYCoordinate});
    return newLink;
  };

  Magellan.Models.Node.prototype.addEdge = function(edgeName) {
    graph.addCell([this.getNextLink("Yes")]);
  };

}
