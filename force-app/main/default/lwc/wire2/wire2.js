import { LightningElement } from 'lwc';
import serachAccs from '@salesforce/apex/LWCExamples.retriveAccs';

const columns = [
    {
        label: 'Name',
        fieldName: 'Name'
    }, {
        label: 'AccountId',
        fieldName: 'AccountId',
        type: 'text'
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
    }, {
        label: 'Email',
        fieldName: 'Email',
        type: 'text'
    },
];

export default class DynamicSearchInLWC extends LightningElement {

    searchData;
    columns = columns;
    errorMsg = '';
    strSearchAccName = '';
    

    handleContactName(event) {
        this.errorMsg = '';
        this.strSearchAccName = event.currentTarget.value;
    }

    handleSearch() {
        if(!this.strSearchAccName) {
            this.errorMsg = 'Please enter contact name to search.';
            this.searchData = undefined;
            return;
        }

        serachAccs({strAccName : this.strSearchAccName})
        .then(result => {
            this.searchData = result;
        })
        .catch(error => {
            this.searchData = undefined;
            if(error) {
                if (Array.isArray(error.body)) {
                    this.errorMsg = error.body.map(e => e.message).join(', ');
                } else if (typeof error.body.message === 'string') {
                    this.errorMsg = error.body.message;
                }
            }
        }) 
    }
}