import { LightningElement, track } from "lwc";

export default class SimpleCalc extends LightningElement {
  @track num1;
  @track num2;
  @track result;
  @track oper = "+";

  get operOpt() {
    return [
      { label: "+", value: "+" },
      { label: "-", value: "-" },
      { label: "*", value: "*" },
      { label: "/", value: "/" },
    ];
  }

  calcExpr() {
    switch (this.oper) {
      case "+":
        this.result = Number(this.num1) + Number(this.num2);
        break;
      case "-":
        this.result = Number(this.num1) - Number(this.num2);
        break;
        case "*":
        this.result = Number(this.num1) * Number(this.num2);
        break;
        case "/":
        this.result = Number(this.num1) / Number(this.num2);
        break;
      default:
        this.result = "";
    }
  }

  handleChangeNum1(evt) {
    this.num1 = evt.target.value;
    this.calcExpr();
  }
  handleChangeNum2(evt) {
    this.num2 = evt.target.value;
    this.calcExpr();
  }

  handleChangeOper(evt) {
    this.oper = evt.target.value;
    this.calcExpr();
  }
}