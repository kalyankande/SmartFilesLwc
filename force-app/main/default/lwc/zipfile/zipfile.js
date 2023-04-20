import { LightningElement, track, api} from 'lwc';
import getfileIds from '@salesforce/apex/RecordFileDownloaderController.getfileIds';
export default class RecordFileDownloader extends LightningElement {
    @api recordId;
    @track fileIds = '';
    @track error = '';
    
    connectedCallback() {
        getfileIds({
            recordId : this.recordId
        })
        .then(result => {
            let fileDataList = JSON.parse(JSON.stringify(result));
            console.log(result);
            let fileIdsString = '';
            if(fileDataList) {
                for (let i in fileDataList) {
                    fileIdsString += fileDataList[i]+'/';
                }
            }
            if(fileIdsString.length > 0) {
                fileIdsString =fileIdsString.replace(/.$/,"?");
            }
            this.fileIds = fileIdsString;
            
            this.error = undefined;
            console.log('this.fileIds'+this.fileIds);
        })
        .catch(error => {  console.log('error : '+JSON.stringify(error));
            this.error = error;
        });
    }
    
    get getDownloaLink() {
        return '/sfc/servlet.shepherd/version/download/'+this.fileIds;
    }
}