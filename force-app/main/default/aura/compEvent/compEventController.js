({
    fireComponentEvent : function(cmp, event) {
        var cmpEvent = $A.get("e.c:cmpEvent");
        cmpEvent.setParams({
            "message" : "A component event fired me." });
        cmpEvent.fire();
    }  
})