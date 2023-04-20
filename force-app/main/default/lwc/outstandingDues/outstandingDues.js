import { LightningElement,wire,api } from 'lwc';
import getDue from '@salesforce/apex/Task2.getDue';
export default class Hackathon extends LightningElement {
    @api recordId;
    customers;
    error;
    sum = 0;
    display = false
    //@wire(getDue,{customerID:this.recordId})customers;
    Over2(){
        getDue({customerID:this.recordId})
        .then((result)=>{
            this.customers = result;
        }).catch((error)=>{
            this.error = errorl
            this.customers = undefined;
        });
        for(var i=0;i<this.customers.length;i++){
            console.log(this.customers);
            this.sum = this.sum+ this.customers[i]['Actual_Fare__c'];
        }
        if(this.sum > 0){
            this.display = true;
        }
    }

}