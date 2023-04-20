import { LightningElement } from 'lwc';
import PARSER from '@salesforce/resourceUrl/Papaparse';
import { loadScript } from 'lightning/platformResourceLoader';
import getJSONData from '@salesforce/apex/JsonParseringClass.getJSONData';


export default class Testcomponentforcsvparsing extends LightningElement {
    ContactList=[];
    parserInitialized = false
    renderedCallback() {
        if (!this.parserInitialized) {
            Promise.all([
                    loadScript(this,PARSER),
                ])
                .then(() => {
                    console.log('Papa Parser loaded successfully.');
                })
                .catch(error => {
                    console.log('Failed to load JS lib:', error);
                });
        }
    }
    handleInputChange(event){
        if(event.target.files.length > 0){
            const file = event.target.files[0];
            Papa.parse(file, {
                quoteChar: '"',
                header: 'true',
                complete: (results) => {
                    console.log(results.data);
                    //ContactList = results.data;
                    getJSONData({input:results.data}).then(data =>{
                        console.log('selectedobjects'+data);
                      })
                      .catch(error => {
                        console.log(error);
                        this.error = error;
                    }); 
                },
                error: (error) => {
                    console.error(error);
                }
            });
        }
}
}