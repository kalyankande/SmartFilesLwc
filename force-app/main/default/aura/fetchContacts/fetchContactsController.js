({
    handleComponentEvent : function(cmp, event) {
        var message = event.getParam("recdId");
        alert('Id of clicked record is ::'+message);
    }
})