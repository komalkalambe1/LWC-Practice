import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/digitalAccountOppFetch.getAccounts';

export default class AccountList extends LightningElement {
    @track accounts;
    @track error;
    @track selectedAccountId;

    columns = [
        { label: 'Account Name', fieldName: 'Name', type: 'text' }
    ];

    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.accounts = undefined;
        }
    }

    handleAccountClick(event) {
        const selectedRow = event.detail.row;
        this.selectedAccountId = selectedRow.Id;
    }
}