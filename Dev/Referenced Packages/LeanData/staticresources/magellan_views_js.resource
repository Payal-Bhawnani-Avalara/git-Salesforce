function initializeMagellanViews(){
	if (typeof Magellan === "undefined")
		Magellan = {};

	if (typeof Magellan.Views === "undefined")
		Magellan.Views = {};


	//from http://www.egstudio.biz/tiny-inline-edit-plugin-for-jquery/
	$.fn.inlineEdit = function(replaceWith, connectWith) {

	  $(this).hover(function() {
      $(this).addClass('hover');
	  }, function() {
      $(this).removeClass('hover');
	  });

	  $(this).click(function() {

	    var elem = $(this);

	    elem.hide();
	    elem.after(replaceWith.html($(this).val()));
	    replaceWith.focus();

	    replaceWith.blur(function() {

        if ($(this).val() != "") {
          connectWith.val($(this).val()).change();
          elem.text($(this).val());
        }

        $(this).remove();
        elem.show();
        //Nathan's note:
        //this seems stupid
        elem.trigger("change");
	    });
	  });
	};

	Magellan.Views.NodeCreatorMenu = Backbone.View.extend({
		
	});

	Magellan.Views.NodeForm = Backbone.View.extend({
		template: _.template(magellanDocument.getElementById("magellan_node_form_template").innerHTML),

		initialize: function() {	
			// this.listenTo(this.model.nodeInfo, 'change', this.resyncModels);
		},

		events: {
			'change #name-input' : 'changeNodeName',
			'click .showLink' : 'toggleLinkToEdge',
			'click #add-edge-icon' : 'addEdgeToModel',
			'click #delete-edge-icon' : 'deleteEdge',
			'change .edge-name.editable-property' : 'changeEdgeName',
			'change #set-object-type' : 'changeObjectType'
		},

		addEdgeToModel: function(e) {
			e.preventDefault();
			this.model.nodeInfo.edges.push(new Magellan.Models.Edge(this.model, null, "(NEW EDGE)", "Custom", true));
			var params = {"renderForm" : true};
			this.model.resyncNodeInfoAndPresentation(params);
		},

		changeEdgeName: function(e) {
			e.preventDefault();
			var name = e.currentTarget.attributes.name.value;
			var newName = e.currentTarget.textContent;
			var edgeModel;
			for (var i = 0; i < this.model.nodeInfo.edges.length; i++) {
				if (this.model.nodeInfo.edges[i].name === name) {
					this.model.nodeInfo.edges[i].name = newName;
					edgeModel = this.model.nodeInfo.edges[i];
				}
			}
			var params = {"renderForm" : true};
			if (edgeModel.linkId) params["renameLink"] = edgeModel;
			this.model.resyncNodeInfoAndPresentation(params);
		},

		deleteEdge: function(e) {
			e.preventDefault();
			var edgeName = e.currentTarget.name;
			var edgeModel;
			var linkId;
			for (var i = 0; i < this.model.nodeInfo.edges.length; i++) {
				if (this.model.nodeInfo.edges[i].name === edgeName) {
					//remove edge from model, get linkId
					//to delete jointjs/presentation object
					linkId = this.model.nodeInfo.edges[i].linkId;
					this.model.nodeInfo.edges.splice(i,1);
				}
			}
			var params = {"renderForm" : true};
			if (linkId) params["deleteLink"] = linkId;
			this.model.resyncNodeInfoAndPresentation(params);
		},

		toggleLinkToEdge: function(e) {
			e.preventDefault();
			var edgeName = e.currentTarget.name;
			for (var i = 0; i < this.model.nodeInfo.edges.length; i++) {
				if (this.model.nodeInfo.edges[i].name === edgeName) var edgeModel = this.model.nodeInfo.edges[i];
			}
			// edgeModel.hasLink = !edgeModel.hasLink;
			var actionKey = !edgeModel.linkId ? "createLink" : "destroyLink";
			var params = {};
			params[actionKey] = {};
			params[actionKey][edgeModel.name] = true;
			this.model.resyncNodeInfoAndPresentation(params);
		},

		changeNodeName: function(e) {
			e.preventDefault();
			this.model.nodeInfo.name = e.currentTarget.innerHTML;
			this.model.resyncNodeInfoAndPresentation();
		},

		changeObjectType: function(e) {
			e.preventDefault();
			//maybe should make this event directly on the option, not the select
			this.model.nodeInfo.objectType = $(e.currentTarget).find(":selected").val();
			this.model.resyncNodeInfoAndPresentation();
		},

		render: function() {
			//the view should deal only with the "nodeInfo" parameter, which represents
			//the actual business logic part which apex cares about
			//we will listen to changes to this core and render in the jointjs views appropriately
			var content = this.template({node: this.model.nodeInfo, nodeType: "ACTION"});
			this.$el.html(content);
			this.$el.find(".editable-property").inlineEdit($('<input name="temp" type="text" />'),$("#inline-edit-holder"));
			return this;
		}
	});

	Magellan.Views.ActionNodeDropdown = Backbone.View.extend({
		template: _.template(magellanDocument.getElementById("magellan_action_dropdown_template").innerHTML),
		render: function() {
			this.$el.html(this.template({actionTypes: Magellan.Models.ActionNode.getActionNodeStencils()}));
			return this;
		}
	});
}