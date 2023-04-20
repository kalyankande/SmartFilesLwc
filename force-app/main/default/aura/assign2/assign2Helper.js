({
 addHelper : function(component, event, helper) {
  console.log("you pressed me buddy!");
        var first = component.get("v.fname");
        var last = component.get("v.lname");
        console.log(first);
        
        var fullname = parseInt(last) + parseInt(first);
        console.log(fullname);
        
        component.set("v.fullname",fullname);
 }
})