({
    handleOnLoad:function(component,event,helper){

    },
    handleOnSubmit:function(component,event,helper){
        event.preventDefault();
        var recld=component.get('vrecordid');
        var evenFields=event.getParam("fields");
        eventFields["Accountid"]=recid;
        component.find('recordEditForm').submit(eventFields);

    },
    handleOnSuccess:function(component,event,helper){
        var params=event.getParams();
        var recid=params.response.id;
        var toastEvent=$A.get("e.force:showToast");
        toastEvent.setParams({
            "title":"Success!",
            "type":"Success",
            "message":"Contact has been created Successfully"

        });
        toastEvent.fire();
        var navEvent = $A.get("e.force:navigateToSObject");
        navEvent.setParams({
            "recordid":recid,
            "slideDevName":"related"

        });
        navEvent.fire();
    },
     handleOnError:function(component,event,helper){
         alert('inside Error');
     }

})