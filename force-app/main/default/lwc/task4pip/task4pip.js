import { LightningElement,wire } from 'lwc';
import getOpportunityStats from '@salesforce/apex/OpportuninyController.OpportunityOwnerPerformance';

const COLUMNS = [
    { label: 'Owner Name', fieldName: 'OwnerName' },
    { label: 'Opportunities', fieldName: 'OpportunityCount', type: 'number' },
    { label: 'Success Rate', fieldName: 'SuccessRate', type: 'percent', typeAttributes: { maximumFractionDigits: 2 } },
];
export default class OpportunityOwnerPerformance extends LightningElement {columns = COLUMNS;
    ownerPerformance;
    error;

    @wire(getOpportunityStats)
    handleOpportunityStats({ error, data }) {
        if (data) {
           // console.log('data '+JSON.stringify(data));
            this.ownerPerformance = data;
           // console.log('opp',this.ownerPerformance);
            this.error = undefined;
        } else if (error) {
            this.error = error;
           // console.log('error '+JSON.stringify(this.error));
            this.ownerPerformance = undefined;
        }
    }

    get noData() {
        return !this.ownerPerformance && !this.error;
    }
}