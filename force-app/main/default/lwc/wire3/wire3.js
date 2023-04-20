import { LightningElement ,track} from 'lwc';
import getOppRecords from '@salesforce/apex/Part3Assignment3.getOppRecords';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'CloseDate', fieldName: 'CloseDate' },
    { label: 'Amount', fieldName: 'Amount' },
    { label: 'StageName', fieldName: 'StageName' },
    { label: 'Id', fieldName: 'Id' }
];
export default class Part3Assignment3 extends LightningElement {
    @track opp;
    value=0;
    columns = columns;
    searchString(event) {
        var inputCmp = this.template.querySelector('.inputAmount');
        this.value = inputCmp.value;
        console.log('this.value',this.value);
        getOppRecords({ searchname: this.value })
        .then((result) => {
            console.log('result'+JSON.stringify(result));
           this.opp=result;
      
        })
        .catch((error) => {
            this.error = error;
        });
    }

}