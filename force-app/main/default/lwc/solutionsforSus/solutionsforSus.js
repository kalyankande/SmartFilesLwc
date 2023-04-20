import { LightningElement,api,track } from 'lwc';
import tasks from '@salesforce/apex/AccountController.tasks';
import saveSelectedTasks from '@salesforce/apex/AccountController.saveSelectedTasks';
import GreenValue from '@salesforce/label/c.Green';
import YellowValue from '@salesforce/label/c.Yellow';
import RedValue from '@salesforce/label/c.Red';



export default class SolutionsforSus extends LightningElement {
    @api recordId;
    @track displayText='';
    @track selectedTasks = [];  
    dispalyData = false; 
    valueDescription ; 
    
    connectedCallback() {
       this.handeleTask();
        
    }

    handeleTask(){
        tasks({'recordId':this.recordId}).
       
        then(result => {
            console.log('16'+this.recordId);
            console.log('Result ', (JSON.stringify(result)));
            const color = result[0].Color__c;
            this.displayText=result;
            console.log('Result ', (color));
            if(result.length>0){
                this.dispalyData = true;
            }
            if (color == "Red"){
                this.valueDescription = RedValue;
            }
            else if(color == "Yellow"){
                this.valueDescription = YellowValue;
            }
            else if(color == "Green")
            {
                this.valueDescription = GreenValue;
            }
            else
            this.valueDescription ='';
            
        })
        
    }
    handleCheckboxChange(event) {
        // let value = event.target.value;
        let name = event.target.label;
        console.log('name', name);
        // console.log('value', value);
        this.selectedTasks.push(name) ;
       // this.select[name]= this.selectedTasks;
        
        console.log('selected task',this.selectedTasks);
    }



    handleSaveClick() {
        console.log('task '+this.selectedTasks);
        
        const myJsonString = JSON.stringify(this.selectedTasks);
        console.log('json string '+myJsonString);
        saveSelectedTasks({
            selectedTasks : myJsonString,
            conRecId      : this.recordId
        })
        .then(result =>
            console.log('result ',result)
        )
        .catch(error => 
            console.log('error ',error)    
        );
        location.reload();
        
    }


}