import LightningDatatable from 'lightning/datatable';
import PicklistTemplate from './picklist-template.html';
import LookupTemplate from './lookup-template.html';

export default class DataTable extends LightningDatatable {
    static customTypes = {
        picklist: {
            template: PicklistTemplate,
            typeAttributes: ['label', 'placeholder', 'options', 'value', 'context'],
        },
        lookup: {
            template: LookupTemplate,
            typeAttributes: ['uniqueId', 'object', 'icon', 'label', 'displayFields', 'displayFormat', 'placeholder', 'filters']
        }
    };
}