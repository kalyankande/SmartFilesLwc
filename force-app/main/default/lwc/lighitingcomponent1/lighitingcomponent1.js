import { LightningElement,track } from 'lwc';

export default class Lighitingcomponent1 extends LightningElement {
    @track name
    name = "kande";
    handleButtonClick(){

        alert("Button Clicked!!");
    }
    handleNameChange(event){
        console.log("Button Clicked");
        this.name = event.detail.value;

        console.log(event.target.dataset.abc);

    }
    value = 'inProgress';

    get options() {
        return [
            { label: 'Red', value: 'Red' },
            { label: 'Green', value: 'Green' },
            { label: 'Blue', value: 'Blue' },
            { label: 'Yellow', value: 'Yellow' },
            { label: 'Black', value: 'Black' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }
}