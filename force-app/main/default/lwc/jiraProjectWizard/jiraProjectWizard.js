import { LightningElement } from 'lwc';
import checkJiraKeyAvailable from '@salesforce/apex/JiraProjectWizardController.checkJiraKeyAvailable';

export default class JiraProjectWizard extends LightningElement {

    filter = {
        criteria: [
            {
                fieldPath: "JIRA_User_Id__c",
                operator: "ne",
                value: ""
            }
        ]
    }

    key; 
    projectName;
    projectLead;
    available;
    notCheckedKey = true;

    handleKeyChange(event){
        this.key = event.target.value;
    }

    handleNameChange(event){
        this.projectName = event.target.value;
    }

    handleLeadChange(event){
        this.projectLead = event.detail.recordId;
    }

    async handleKeyCheck(){
        this.available = await checkJiraKeyAvailable({key: this.key});
        this.notCheckedKey = false;
    }
}