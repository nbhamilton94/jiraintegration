# Salesforce <-> Jira Integration 
This repository is a Salesforce and Jira integraiton that allows a business to manage their support process through JIRA and their sales process through salesforce.
- We want to be able to kick off our Jira support process using data that exists inside of salesforce. This is done by having a wizard where the user enters the necessary data for each project and verify the data from Jira.
- Every opportunity is associated with a version in Jira.
- All issues from Jira will be associated with a case from Salesforce. The related project and version ids allow us to link back to the opportunity and account in Salesforce. This information is visible on the Case record.
- Issues have the option for a one-time sync or a scheduled sync.
    
## Tools I used
- Visual Studio Code with the SFcli extensions
- Postman to simulate REST callouts
- A Salesforce Developer Edition Org

## Concepts Demonstrated
- Lightning Web Components: Created lightning web components that are displayed through a button/quick action on the Account, Opportunity, and Case Objects.
- Batch Apex: Used for the hourly sync of jira issues with salesforce
- Queueable Apex: Used for a one time sync of jira issues with salesforce
- Named Credendials: Set up the Jira external credentials with a Basic Auth protocol and Salesforce Named credential to my jira organizatoin 
- Basic Authentication: Create API key from Jira and use it as a part of my external credentials
- Permission Sets: Configure the External Credential Principal Access and add my Jira External Credentials to the "Enabled" section, and assign the permission set to users who will be using my integration
- Unlocked Packages: Packaged and Deployed this using unlocked packages 

