import { LightningElement, api } from 'lwc';
import VERSION_NAME from "@salesforce/schema/Opportunity.JIRA_Fix_Version_Name__c";
import createVersion from '@salesforce/apex/JIRAVersionController.createVersion';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class JiraVersionWizard extends LightningElement {
    nameField = VERSION_NAME;

    @api recordId;
    @api objectApiName;

    async handleVersionCreate() {
        try{
            await createVersion({oppId: this.recordId});
            this.dispatchEvent(new CloseActionScreenEvent());
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Success",
                    message: "Jira Version Created",
                    variant: "success"
                })
            );
        } catch(e){
            console.error(e);
        }
    }
}