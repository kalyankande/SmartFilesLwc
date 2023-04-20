({
   init: function (cmp, event, helper) {
       var actions = [{ label: 'Show details', name: 'show_details' }];
       
          cmp.set('v.mycolumns', [
              { type: 'action', typeAttributes: { rowActions: actions } },
              {label: 'Name', fieldName: 'Name', type: 'text'},
              {label: 'Type', fieldName: 'Type', type: 'type'},
              {label: 'Website', fieldName: 'Website', type: 'type'},
              {label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type: 'type'},
              {label: 'Phone', fieldName: 'Phone', type: 'type'},
              {label: 'Rating', fieldName: 'Rating', type: 'type'}
       ]);
        helper.getData(cmp);
    },
    
    handleRowAction : function(cmp,event,helper){
       var action = event.getParam('action');
       var row = event.getParam('row');
     // navigate to sObject detail page     
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": row.Id,
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
    
})