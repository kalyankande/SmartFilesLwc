({
    getData:function(cmp){
        var action=cmp.get('c.getopportynity');
        action.setCallback(this,$A.getCallback(function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var oResponse=response.getReturnValue();
                cmp.set("v.mydata",oResponse);
            }else if(state==="ERROR"){
                var errors=response.getError();console.error(errors);
            }
        }
        ));
        $A.enqueueAction(action)}
    
})