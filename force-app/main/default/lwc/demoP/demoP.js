import { LightningElement, api, wire,track } from 'lwc';
import getRelatedFilesByRecordId from '@salesforce/apex/demopclass.getRelatedFilesByRecordId'
import {NavigationMixin} from 'lightning/navigation'
import JSZip from '@salesforce/resourceUrl/JSZip';


const actions = [
    { label: 'Preview', name: 'show_details' },
    
];

const columns = [
    { label: 'Title', fieldName: 'contentTiTle' },
    { label: 'Owner', fieldName: 'Ownername' },
    { label: 'Last Modified', fieldName: 'lastModified' },
    { label: 'Size', fieldName: 'size' },
    { label: 'Type', fieldName: 'fielExtension' },
    
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];



export default class DemoP extends NavigationMixin(LightningElement) {
    Display = true;
    columns = columns;
    @api recordId;
    @track filesList =[];
    @track isShowModal = false;
    filetypesreturned =[];
    iconNames='';
    disfilesList=[];
    selectedRows=[];
    buttonClass = '';
    fileIds = '';
    
    
    
    @wire(getRelatedFilesByRecordId, {recordId: '$recordId'})
    wiredResult({data, error}){ 
        if(data){ 
            console.log('date from wrapper class==>'+JSON.stringify(data))
            this.filesList= data;
            this.disfilesList=data;
            
            for(let i=0;i<this.filesList.length ;i++){
                console.log('ssss');
                this.filetypesreturned.push(this.filesList[i].fielExtension);
            }
            this.filetypesreturned = Array.from(new Set(this.filetypesreturned));
            console.log('filetypesreturned11'+JSON.stringify(this.filetypesreturned));
        }
        if(error){ 
            console.log(error)
        }
    }
    Select(){
        
        if(this.filesList != 0){  
            this.Display=false;
            this.isShowModal = true;
            this.disfilesList=this.filesList;
        }else{
            alert('NO files to Display');
        }
    }
    previewHandler(event){
        
        console.log(event.target.dataset.id)
        const row = event.detail.row;
        console.log('74'+JSON.stringify(row.ContentDocumentId))
        this[NavigationMixin.Navigate]({ 
            type:'standard__namedPage',
            attributes:{ 
                pageName:'filePreview'
            },
            state:{ 
                selectedRecordId: row.ContentDocumentId
            }
        })
    }
    showModalBox() {  
        this.isShowModal = true;
    }
    
    hideModalBox() {  
        this.isShowModal = false;
    }
    
    
    
     iconNames(event) {

        const fileType = event.target.label;
        this.iconNames = this.filesList.filter(item => item.fielExtension.toLowerCase() === 'doctype:{fileType}');


        var iconName = "";
        var name = "";
        if(fielExtension === "xls" || fielExtension === "xlsx") {
            iconName = "doctype:excel";
            name = "XLS";
        } else if(fielExtension === "doc" || fielExtension === "docx") {
            iconName = "doctype:word";
            name = "DOC";
        } else if(fielExtension === "ppt" || fielExtension === "pptx") {
            iconName = "doctype:ppt";
            name = "PPT";
        } else if(fielExtension === "pdf") {
            iconName = "doctype:pdf";
            name = "PDF";
        } else if(fielExtension === "txt") {
            iconName = "doctype:txt";
            name = "TXT";
        } else if(fielExtension === "html") {
            iconName = "doctype:html";
            name = "HTML";
        } else if(fielExtension === "csv") {
            iconName = "doctype:csv";
            name = "CSV";
        } else if(fielExtension === "zip" || stType === "rar") {
            iconName = "doctype:zip";
            name = "ZIP";
        } else if(fielExtension === "xml") {
            iconName = "doctype:xml";
            name = "XML";
        } else if(fielExtension === "mp4") {
            iconName = "doctype:mp4";
            name = "MP4";
        } else if(fielExtension === "png" || fielExtension === "jpg" || fielExtension === "jpeg" || fielExtension === "bmp" || fielExtension === "gif") {
            iconName = "doctype:image";
            name = "IMG";
        } else {
            iconName = "doctype:attachment";
            name = "ATCH";
        }
    }


    
    handleButtonClick(event) {
        
        const fileType = event.target.label;
        this.disfilesList = this.filesList.filter(item => item.fielExtension.toLowerCase() === fileType);
        const clickedButton = event.target;
        
        // Remove the 'slds-button-brand' class from all buttons in the group
        const buttons = this.template.querySelectorAll('lightning-button');
        buttons.forEach(button => button.classList.remove('slds-button_brand'));
        
        // Add the 'slds-button-brand' class to the clicked button
        clickedButton.classList.add('slds-button_brand');
        
        // Set the buttonClass variable to the class name of the clicked button
        this.buttonClass = clickedButton.classList.value;
        
        
    }
    removeselected(){
        this.disfilesList=this.filesList;
        const buttons = this.template.querySelectorAll('lightning-button');
        buttons.forEach(button => button.classList.remove('slds-button_brand'));
        this.buttonClass = buttons;
        
    }
    refreshTable(){
        console.log('kalyan');
        return refreshApex(this.wiredResult);
    }
    handleDownload() {
        let selectedRows = this.template.querySelector('lightning-datatable').getSelectedRows();
        let selectedFiles = [];
        
        for (let i = 0; i < selectedRows.length; i++) {
            let file = selectedRows[i];
            selectedFiles.push({
                ContentDocumentId: file.ContentDocumentId,
                Title: file.Title
            });
        }
        for (let i = 0; i < selectedFiles.length; i++) {
            this.downloadFiles(selectedFiles[i]);
            setTimeout(() => {}, 100000);
        }
        // Call the downloadFiles function to download the selected files
        console.log('selectedFiles after downloadFiles'+ JSON.stringify(selectedFiles));
    }
    
    downloadFiles(selectedFiles) {
        console.log('selectedFiles in downloadFiles '+JSON.stringify(selectedFiles));      
        let file = selectedFiles;
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__recordPage',
            attributes: {
                recordId: selectedFiles.ContentDocumentId,
                actionName: 'view',
            },
        }).then((url) => {
            let fileUrl = '/sfc/servlet.shepherd/document/download/' + file.ContentDocumentId;
             window.open(fileUrl, "_blank",selectedFiles.Title);
            console.log('File url:'+fileUrl);
         document.body.appendChild(downloadLink);
         downloadLink.click();
        document.body.removeChild(downloadLink);
        window.close(url);
        });

    }
    
    
    get downloadallfiles(){
        let selectedFiles1 = [];
        
        // Extract the ContentDocumentId and Title fields for each selected row
        for (let i = 0; i < this.filesList.length; i++) {
            console.log(this.filesList.length);
            let file = [];
            file = this.filesList;
            console.log('file is'+JSON.stringify(file));
            for(let j=0;j<file.length;j++){
                selectedFiles1.push(
                    file[j].ContentDocumentId
                );

            }
            
            console.log('SELECTED FILES: ' + JSON.stringify(selectedFiles1));
            let fileDataList = JSON.parse(JSON.stringify(selectedFiles1));
            console.log('SELECTEDfileDataList  FILES: ' + JSON.stringify(fileDataList));
            let fileIdsString = '';
            if(fileDataList) {
                for (let i in fileDataList) {
                    fileIdsString += fileDataList[i]+'/';
                }
            }
            console.log('FILE DATA LIST IS: ' + JSON.stringify(fileDataList));
            if(fileIdsString.length > 0) {
                fileIdsString =fileIdsString.replace(/.$/,"?");
            }
            this.fileIds = fileIdsString;
            console.log('FILE IDS LIST IS: ' + JSON.stringify(this.fileIds));
           return '/sfc/servlet.shepherd/version/download/'+this.fileIds;
           // return "data:application/zip;base64,"+result


        }
    }
    /*get getDownloaLink() {
        return '/sfc/servlet.shepherd/version/download/'+this.fileIds();
    }*/
}