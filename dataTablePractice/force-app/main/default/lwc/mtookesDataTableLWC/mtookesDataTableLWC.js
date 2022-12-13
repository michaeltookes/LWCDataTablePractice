import { LightningElement, api, track} from 'lwc';

export default class MtookesDataTableLWC extends LightningElement {
    keyIndex = 0;
    @api inputField = [
        {
            Id: 0
        }
    ];
    
    addRow() {
        this.index++;

        this.inputField.push ({
            inputField
        })
    }

}