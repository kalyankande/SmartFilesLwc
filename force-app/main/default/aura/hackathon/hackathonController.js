({
    doInit : function(component, event, helper) {
        helper.getContacts(component);
    },
    displayDetails : function(component, event, helper) {
        helper.displayToast(component, event, helper);
    }
})