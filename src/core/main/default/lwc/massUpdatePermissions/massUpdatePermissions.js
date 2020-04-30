import { LightningElement, track } from 'lwc';

export default class MassUpdatePermissions extends LightningElement {
    @track data = [];
    connectedCallback() {
        this.columns = [
            { label: 'sObject', fieldName: 'sObject', editable: true },
            { label: 'Field', fieldName: 'field', editable: true },
            {
                label: 'Permissions', fieldName: 'perm', type: 'picklist', typeAttributes: {
                    placeholder: '--Select--', options: [
                        { label: 'Read', value: 'Read' },
                        { label: 'Write', value: 'Write' },
                    ] // list of all picklist options
                    , value: { fieldName: 'Read' } // default value for picklist
                    , context: { fieldName: 'Id' } // binding account Id with context variable to be returned back
                }
            },
            {
                label: 'Profile', fieldName: 'profile', type: 'lookup', typeAttributes: {
                    placeholder: '--Select--',
                    uniqueId: { fieldName: 'Id' }, //pass Id of current record to lookup for context
                    object: "Profile",
                    icon: "",
                    label: "Profile",
                    displayFields: "Name, CreatedById",
                    displayFormat: "Name (CreatedById)",
                    filters: ""
                }
            }
        ];

        //sample data
        this.data = [
            { 'sObject': 'Account', 'Field': 'Name'}, 
            { 'sObject': 'Contact', 'Field': 'LastName'}
        ]
    }

    //listener handler to get the context and data
    //updates datatable
    picklistChanged(event) {
        event.stopPropagation();
        let dataRecieved = event.detail.data;
        this.data.forEach(element => {
            if (element.Id === dataRecieved.context) {
                element.Rating = dataRecieved.value;
            }
        });
    }

    handleSelection(event) {
        event.stopPropagation();
        let dataRecieved = event.detail.data;
        this.data.forEach(element => {
            if (element.Id === dataRecieved.key) {
                element.ParentId = dataRecieved.selectedId;
                console.log('Element', element);
            }
        });
    }
}
