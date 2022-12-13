import { LightningElement, api, track} from 'lwc';

export default class MtookesDataTableLWC extends LightningElement {
    keyIndex = 0;
    @api inputField = [
        {
            Id: 0
        }
    ];
    
    addRow() {
        ++this.keyIndex;
        var newRow = [{id: this.keyIndex}];
        this.inputField = this.inputField.concat(newRow);
    }

}