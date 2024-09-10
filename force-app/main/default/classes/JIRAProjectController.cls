public class JIRAProjectController {
    public Id accId {get;set;}
    public Account acc {get;set;}
    
    public JIRAProjectController(ApexPages.StandardController controller) {
        accId = controller.getRecord().Id;
        acc = [SELECT Id, Name, JIRA_Project_Key__c, Jira_Project_Id__c, Jira_Project_Name__c FROM Account WHERE Id =: accId];
    }
    
    public PageReference createProject(){
        JIRAProjectHelper.createOrUpdateProject(acc, '70121:191c7229-9790-4fb2-b931-fc8688d4e865');
        update acc;
        return new PageReference('/'+ accId);
    }
}