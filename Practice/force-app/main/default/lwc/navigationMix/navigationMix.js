import { LightningElement,api,track } from 'lwc';
import oppMethod from '@salesforce/apex/accOppRec.methodName';
import {NavigationMixin} from 'lightning/navigation';


export default class NavigationMix extends NavigationMixin (LightningElement) {
    @track opportunities = [];
    @api recordId;
    @track error = null;
    @track isLoading = false;
 
    connectedCallback(){
        this.getOppRecords();
    }
 
    getOppRecords(){
        this.isLoading = true;
        console.log('Fetching opportunities for Account ID:', this.recordId);
    oppMethod({accId : this.recordId})
    .then((result) =>{
        console.log('Fetched Opportunities:', result);
        this.opportunities = result;
        this.error = null;
    })
    .catch((error) =>{
        console.error('Error fetching opportunities:', error);
        this.error = error;
        this.opportunities = [];
    })
    .finally(()=>{
        this.isLoading = false;
    });
}
 
handleClick(event){
    const opportunityId = event.target.dataset.id;
    if (opportunityId) {
        // Construct the URL for the Opportunity record page
        const url = `/lightning/r/Opportunity/${opportunityId}/view`;
 
        // Open the URL in a new tab
        window.open(url, '_blank');
    }
    // if(opportunityId){
    //     this[NavigationMixin.Navigate]({
    //         type:'standard_recordPage',
    //         attribute : {
    //             recordId : opportunityId,
    //             actionName : 'view',
    //         },
    //     });
    // }
}
   
 

}