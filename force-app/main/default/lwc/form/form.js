import { LightningElement, track } from 'lwc';
export default class LwcValidateInputForm extends LightningElement {
    @track name;
    @track phone;
    @track email;

    onNameChange(event) {
        this.name = event.detail.value;
    }
    onPhoneChange(event) {
        this.phone = event.detail.value;
    }
    onEmailChange(event) {
        this.email = event.detail.value;
    }

    saveContact() {
        const isInputsCorrect = [...this.template.querySelectorAll('lightning-input')]
            .reduce((validSoFar, inputField) => {
                inputField.reportValidity();
                return validSoFar && inputField.checkValidity();
            }, true);
        if (isInputsCorrect) {
         //perform success logic

        }
    }
}