({
    fetchContact : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this,function(response){
            var state= response.getState();
            if(state === "SUCCESS"){
                component.set("v.contacts",response.getReturnValue());
            }else if(state === "INCOMPLETE"){
                alert("INCOMPLETE");
                //do something
            }
                else if(state === "ERROR"){
                    
                    var errors = response.getError();
                    if(errors){
                        if(errors[0] && errors[0].message){
                            console.log("Error Message: "+errors[0].message);
                        }else{
                            console.log("Unknown Error");
                        }
                    }
                }
        });
        $A.enqueueAction(action);
    },
    fireComponentEvent : function(cmp, event) {
        var rcID =event.getSource().get("v.value");
        var cmpEvent = cmp.getEvent("cmpEvent");
        cmpEvent.setParams({
            "recdId" : rcID
        });
        cmpEvent.fire();
    }
})