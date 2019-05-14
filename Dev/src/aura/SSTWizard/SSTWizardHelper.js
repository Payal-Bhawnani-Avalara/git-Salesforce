({
    saveData: function(component, event, helper) {
       var ShowModule = component.get("v.ShowModule");
       var validExpense = component.find('expdate').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.checkValidity();
        }, true);
       
        if(validExpense){
	        var pad = component.find('can').getElement();
	        var dataUrl = pad.toDataURL();
	        console.log('dataUrl:=' + dataUrl);
	        var strDataURI = dataUrl.replace(/^data:image\/(png|jpg);base64,/, "");
	        var action = component.get("c.save");
	        action.setParams({
	            sstData: component.get("v.sstData"),
	            signatureBody: strDataURI
	        });
	        action.setCallback(this, function(response) {
	            var state = response.getState();
	            var message = response.getReturnValue();
	            console.log("message>>>>>>>>" + JSON.stringify(message));
	            if (message == 'record successfully insert') {
	                document.getElementById("showErrorrTractConfig").style.display = "none";
	                document.getElementById("showMessageTractConfig").style.display = "block";
	                component.set("v.ShowModule", true);
	                component.find('btnSubmit').set("v.disabled", true);
	                component.find('btnPrev').set("v.disabled", true);
	                var cmpTarget = component.find('Modalbox1');
                    var cmpBack = component.find('Modalbackdrop');
                    $A.util.addClass(cmpTarget, 'slds-fade-in-open');
                    $A.util.addClass(cmpBack, 'slds-backdrop--open');
	
	            } else {
	                document.getElementById("showMessageTractConfig").style.display = "none";
	                document.getElementById("showErrorrTractConfig").style.display = "block";
	            }
	        });
	        $A.enqueueAction(action);
	    } else {
	           alert('Please complete all required fields.');
	        }  
    },
    isCanvasBlank:function (canvas) {
        var blank = document.createElement('canvas');
        blank.width = canvas.width;
        blank.height = canvas.height;
        return canvas.toDataURL() == blank.toDataURL();
    },
    fetchbusinessEntityTypePicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.businessEntityType"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.businessEntityTypePicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchstateOfInPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.stateOfIn"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.stateOfInPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharRegisteredPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arRegistered"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.arRegisteredPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharFilPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arFil"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.arFilPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchInReturns: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.inRetunrs"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.inRetunrsPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharSSTV: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arSSTV"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.arSSTVPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharNV: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arNV"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.arNVPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchregSSTPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.regSST"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.regSSTPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchcomAffPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.comAff"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.comAffPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchtypeBusPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.typeBus"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.typeBusPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchsstProgPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.sstProg"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.sstProgPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchjoinSSTProgPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.joinSSTProg"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.joinSSTProgPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchsstRemotePicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.sstRemote"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.sstRemotePicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchwaBOCPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.waBOC"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.waBOCPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchConPicklist: function(component, event, helper) {
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.corpCo"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                component.set("v.corpCoPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    doInit: function(component, event, helper) {
        var canvas, ctx, flag = false,
            prevX = 0,
            currX = 0,
            prevY = 0,
            currY = 0,
            dot_flag = false;

        var x = "black",
            y = 2,
            w, h;
        canvas = component.find('can').getElement();
        var ratio = Math.max(window.devicePixelRatio || 1, 1);
        w = canvas.width * ratio;
        h = canvas.height * ratio;
        ctx = canvas.getContext("2d");
        console.log('ctx:=' + ctx);

        canvas.addEventListener("mousemove", function(e) {
            findxy('move', e)
        }, false);
        canvas.addEventListener("mousedown", function(e) {
            findxy('down', e)
        }, false);
        canvas.addEventListener("mouseup", function(e) {
            findxy('up', e)
        }, false);
        canvas.addEventListener("mouseout", function(e) {
            findxy('out', e)
        }, false);
        // Set up touch events for mobile, etc
        canvas.addEventListener("touchstart", function(e) {
            var touch = e.touches[0];
            console.log('touch start:=' + touch);
            var mouseEvent = new MouseEvent("mousedown", {
                clientX: touch.clientX,
                clientY: touch.clientY
            });
            canvas.dispatchEvent(mouseEvent);
            e.preventDefault();
        }, false);
        canvas.addEventListener("touchend", function(e) {
            var mouseEvent = new MouseEvent("mouseup", {});
            canvas.dispatchEvent(mouseEvent);
        }, false);
        canvas.addEventListener("touchmove", function(e) {
            var touch = e.touches[0];
            var mouseEvent = new MouseEvent("mousemove", {
                clientX: touch.clientX,
                clientY: touch.clientY
            });
            canvas.dispatchEvent(mouseEvent);
            e.preventDefault();

        }, false);

        // Get the position of a touch relative to the canvas
        function getTouchPos(canvasDom, touchEvent) {
            var rect = canvasDom.getBoundingClientRect();
            return {
                x: touchEvent.touches[0].clientX - rect.left,
                y: touchEvent.touches[0].clientY - rect.top
            };
        }

        function findxy(res, e) {
            const rect = canvas.getBoundingClientRect();
            if (res == 'down') {
                prevX = currX;
                prevY = currY;
                currX = e.clientX - rect.left;
                currY = e.clientY - rect.top;

                flag = true;
                dot_flag = true;
                if (dot_flag) {
                    ctx.beginPath();
                    ctx.fillStyle = x;
                    ctx.fillRect(currX, currY, 2, 2);
                    ctx.closePath();
                    dot_flag = false;
                }
            }
            if (res == 'up' || res == "out") {
                flag = false;
            }
            if (res == 'move') {
                if (flag) {
                    prevX = currX;
                    prevY = currY;
                    currX = e.clientX - rect.left;
                    currY = e.clientY - rect.top;
                    draw(component, ctx);
                }
            }
        }

        function draw() {
            ctx.beginPath();
            ctx.moveTo(prevX, prevY);
            ctx.lineTo(currX, currY);
            ctx.strokeStyle = x;
            ctx.lineWidth = y;
            ctx.stroke();
            ctx.closePath();
        }

    },
    eraseHelper: function(component, event, helper) {
        var m = confirm("Want to clear");
        if (m) {
            var canvas = component.find('can').getElement();
            var ctx = canvas.getContext("2d");
            var w = canvas.width;
            var h = canvas.height;
            ctx.clearRect(0, 0, w, h);
        }
    },
    coStateVoluteer: function(component, event, helper) {
        for (var cmp in component.find('newSSTform')) {
            if (component.find("newSSTform")[cmp].get("v.name") == 'stateCo') {
                var nav = component.find("newSSTform")[cmp].get("v.value");
                if (nav == "AR") {
                    component.set("v.showArV", false);
                    component.set("v.showArVol", false);
                    component.set("v.showCoV", true);
                }
            }
        }
    }
})