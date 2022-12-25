import { LightningElement, track, api} from 'lwc';

export default class MtookesDataTableLWC2 extends LightningElement {

    keyIndex = 0;
    @api itemList = [
        {
            id: 0
        }
    ];

    addRow() {
        ++this.keyIndex;
        var newItem = [{ id: this.keyIndex }];
        this.itemList = this.itemList.concat(newItem);
    }

}