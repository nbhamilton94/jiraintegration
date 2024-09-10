public class JIRAProjectController {
    public Id accId {get;set;}
    public Account acc {get;set;}
    
    public JIRAProjectController(ApexPages.StandardController controller) {
        accId = controller.getRecord().Id;
        acc = [SELECT Id, Name, JIRA_Project_Key__c, JIRA_Project_Id__c, JIRA_Project_Name__c, JIRA_Project_Lead__c,
        JIRA_Project_Lead__r.JIRA_User_Id__c FROM Account WHERE Id =: accId];

        if(acc.JIRA_Project_Lead__c == null) {
            throw new JIRAException('Please select a project lead');
        }
    }
    
    public PageReference createProject(){
        JIRAProjectHelper.createOrUpdateProject(acc, acc.JIRA_Project_Lead__r.JIRA_User_Id__c);
        update acc;
        return new PageReference('/'+ accId);
    }
}