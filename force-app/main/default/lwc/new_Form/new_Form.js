import { LightningElement } from 'lwc';

export default class createRecordForm extends LightningElement {
    accountId;
    handleSuccess(event) {
        this.accountId = event.detail.id;
    }
}