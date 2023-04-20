({
    displayToast : function(component,event) {
        var recId = event.target.dataset.id;
        var navEvent = $A.get("e.force:navigateToSObject");
        navEvent.setParams({
            "recordId":recId,
            "slideDevName":"detail"
        });
        navEvent.fire();
    },
    getContacts : function(component) {
        var action = component.get("c.getAllhubs");
        
        //Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            var state = actionResult.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.hubs", actionResult.getReturnValue());
            }            
        });
        $A.enqueueAction(action);
    }
})