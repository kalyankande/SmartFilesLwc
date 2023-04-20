public class AccountController {
    @auraEnabled
    Public static list<net_zero__mdt> tasks(String recordId){
        Contact con = [Select id,Grade__c from Contact where id=:recordId];
        List<net_zero__mdt> cmdt1 = new List<net_zero__mdt>();
        string accid = con.id;
        String grade = con.Grade__c;
        List<net_zero__mdt> cmdt = [Select Color__c,Solution__c,Description__c from net_zero__mdt Where Color__c=:grade];
        system.debug('Solutions are '+cmdt);
        
        
        List<String> taskSubjectList = new List<String>();
        list<task> tasks = [Select subject FROM Task WHERE WhoId =:recordId];
        for(task ts:tasks){
            taskSubjectList.add(ts.subject);
        }
        system.debug('tasks'+tasks);
        for(net_zero__mdt mdt:cmdt){
            if(!taskSubjectList.contains(mdt.Solution__c)){
                cmdt1.add(mdt);
            } 
          }

        return cmdt1;
        
    }
    @auraEnabled
    public static void saveSelectedTasks(List<String> selectedTasks,String conRecId) {
        List < Task > tasksToUpdate = new List < Task > ();
        System.debug(selectedTasks);
        
        
        
                    
                  
        for(string obj:selectedTasks){
                    Task tt = new Task();
                    tt.WhoId = conRecId;
                    tt.Subject = obj;
                    tasksToUpdate.add(tt);
                    
    
        }
        System.debug('task '+tasksToUpdate);
        insert tasksToUpdate;
    }    
}