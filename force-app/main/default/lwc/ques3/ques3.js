import { api, LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import conMainObject from '@salesforce/schema/Contact';
import conFirstName from '@salesforce/schema/Contact.FirstName';
import conLastName from '@salesforce/schema/Contact.LastName';
import conPhone from '@salesforce/schema/Contact.Phone';
import conEmail from '@salesforce/schema/Contact.Email';
import conBirthdate from '@salesforce/schema/Contact.Birthdate';
import accid from '@salesforce/schema/Contact.AccountId';
export default class Form extends LightningElement {
    @api recordId;
    //accountId;
    contactId;
    firstName = '';
    lastName = '';
    birthDate='';
    phone= '';
    email=''
    handleNameChange(event) {
        this.firstName = event.target.value;
        this.lastName = event.target.value;
        this.birthDate = event.target.value;
        this.phone = event.target.value;
        this.email = event.target.value;
    }
    createContact() {
        const fields = {};
        fields[conFirstName.fieldApiName] = this.firstName;
        fields[conLastName.fieldApiName] = this.lastName;
        fields[conEmail.fieldApiName] = this.email;
        fields[conBirthdate.fieldApiName] = this.birthDate;
        fields[conPhone.fieldApiName] = this.phone;
        fields[accid.fieldApiName] = recordId;
        
        const recordInput = { apiName: conMainObject.objectApiName, fields };
        createRecord(recordInput)
            .then(contact => {
                this.contactId = contact.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'contact created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    
}
}