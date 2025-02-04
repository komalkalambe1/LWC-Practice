import { LightningElement, wire, track } from 'lwc';
import getContactRecordTypes from '@salesforce/apex/ContactController.getContactRecordTypes';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class ContactCreationForm extends LightningElement {
    @track recordTypes = []; // Store available record types
    @track selectedRecordTypeId = null; // Selected record type
    showForm = false; // Show/hide form

    // Fetch record types for Contact
    @wire(getContactRecordTypes)
    wiredRecordTypes({ data, error }) {
        if (data) {
            this.recordTypes = data.map(rt => ({
                label: rt.Name,
                value: rt.Id
            }));
        } else if (error) {
            this.showToast('Error', 'Failed to load record types', 'error');
        }
    }

    // Handle record type selection
    handleRecordTypeChange(event) {
        this.selectedRecordTypeId = event.detail.value;
        this.showForm = true;
    }

    // Handle success event after form submission
    handleSuccess(event) {
        this.showToast('Success', 'Contact created successfully', 'success');
    }

    // Show toast messages
    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}