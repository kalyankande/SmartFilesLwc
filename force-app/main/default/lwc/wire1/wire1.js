import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Account.Name',
    'Account.Type',
    'Account.Phone',
    'Account.Industry',
    'Account.BillingAddress',
    'Account.AnnualRevenue',
];

export default class WireGetRecordDynamicContact extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;

    get Name() {
        return this.account.data.fields.Name.value;
    }

    get Type() {
        return this.account.data.fields.Type.value;
    }

    get phone() {
        return this.account.data.fields.Phone.value;
    }

    get Industry() {
        return this.account.data.fields.Industry.value;
    }
    get BillingAddress() {
        return this.account.data.fields.BillingAddress.value;
    }
    get AnnualRevenue() {
        return this.account.data.fields.AnnualRevenue.value;
    }
   
}