import { LightningElement, api, track } from 'lwc';

export default class SmartDownload extends LightningElement {
    // Attributes to display details and actions
    @api title = 'Smart Download';
    @api iconName = 'standard:document';
    @api buttonLabel = 'Download All';
    @api buttonLabelv2 = 'Select';
   // @track bEnableSelect = true;
    @track bEnableDownloadAll  = true;
    @track bEnableSelect=false
    @api bEnableFilter ;
    @track modalClass = 'slds-hide';

    // Attributes to store platform details
    @api recordId;

    // Attributes to perform in actions
    //@api bDirect = false;
    @track bDisabled = false;

    @track bSpinner = false; 
    @track bError = false;

    handleClickv3() {
        console.log('working');
        this.bEnableSelect = true;
        this.modalClass = 'slds-show';
        this.bEnableFilter = true;
        // bEnableSelect = true;
        // Handle button click action
    }

    handleClick() {
       // this.modalClass = 'slds-hide';
        //this.bDirect=true;
       this.bEnableSelect = true;
        this.template.querySelector("c-child-cmp-table").downloadAllFilesZip();
    }

    handleRefresh() {
        this.bEnableSelect = true;
        this.template.querySelector("c-child-cmp-table").handleRefresh();

        
       
    }

    closeModal() {
        this.modalClass = 'slds-hide';

        // Handle button click action
    }
    
}