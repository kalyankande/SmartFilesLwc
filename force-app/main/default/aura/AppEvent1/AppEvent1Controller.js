({
    fireApplicationEvent : function(cmp, event) {
        var appEvent = $A.get("e.c:applicationEvent");
        appEvent.setParams({
            "message" : "An application event fired me. "  });
        appEvent.fire();
    }
})