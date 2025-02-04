import { LightningElement, api, track, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/digitalOppList.opportunityRecords';

export default class OppList extends LightningElement {
    @api accountId;
    @track opportunities = [];
    @track error;

    @wire(getOpportunities, { accountId: '$accountId' })
    wiredOpportunities({ data, error }) {
        if (data) {
            this.opportunities = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.opportunities = undefined;
        }
    }
}