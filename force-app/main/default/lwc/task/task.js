import { LightningElement,track } from 'lwc';

export default class Part2Assignment5 extends LightningElement {
    value='';
    @track tasklist=[];
    @track donelist=[];
    //templist=[];
    handleClick(event) {
        try{
            var inputCmp = this.template.querySelector('.inputName');
            this.value = inputCmp.value;
            console.log('this.value',this.value);
            if(inputCmp.value=="")
            {
                inputCmp.setCustomValidity("Please name your Task");
            }
            else {
                inputCmp.setCustomValidity('');}
            inputCmp.reportValidity();
            if(this.tasklist.length===0 && this.value!='')
            {
                this.tasklist.push(this.value);
            }
            else if(this.tasklist.length!=0 && this.value!='')
            {
                const found = this.tasklist.find(element => {
                    return element.toLowerCase() === this.value.toLowerCase();
                });
                console.log(found);
                if(found===undefined)
                {
                    this.tasklist.push(this.value);
                    console.log(this.tasklist);
                }
                else if(found!=undefined)
                {
                    inputCmp.setCustomValidity("Task already exists");
                }
                else {
                    inputCmp.setCustomValidity('');}
                inputCmp.reportValidity();
            }
            console.log(this.tasklist);
        
        }catch(e){
            console.error(e);
            console.error('e.name => ' + e.name );
            console.error('e.message => ' + e.message );
            console.error('e.stack => ' + e.stack );
        }
    }
    selection;
    handleChange(event){
        try{
            //var checkboxes = this.template.querySelectorAll('lightning-input');
            //if (checkboxes.checked) this.templist.push(checkboxes);
           // console.log(checkboxes.value);
            //console.log(this.templist);
           const checked = Array.from(
                this.template.querySelectorAll('lightning-input')
            )
                // Filter down to checked items
                .filter((element) => element.checked)
                // Map checked items to their labels
                .map((element) => element.label);
                this.donelist.push(checked[0]);
                this.tasklist = this.tasklist.filter(item => item !== checked[0]);
        }catch(e){
            console.error(e);
            console.error('e.name => ' + e.name );
            console.error('e.message => ' + e.message );
            console.error('e.stack => ' + e.stack );
        }
        
    }
}