import { LightningElement} from 'lwc';
export default class CheckBoxClassDet extends LightningElement
{
    isChecked = true;
    result;
 selectDeselectAll(event) {
        if (event.target.checked)
  {
    
        this.result = 'checkbox is checked';
  }
  else
  {
   
    this.result = 'checkbox is unchecked';
  }
}
}