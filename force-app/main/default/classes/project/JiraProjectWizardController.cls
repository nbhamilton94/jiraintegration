public with sharing class JiraProjectWizardController {
    
    /**
     * 
     * @param key Potential jira key
     * @return true if key has not been taken
     */

    @AuraEnabled
    public static Boolean checkJiraKeyAvailable(String key){
        Boolean available = false;
        try {
            HttpResponse res = JiraCallout.getProject(key);
            // Returns 404 if not found
            // Returns 200 if found
            // Returns 401 if unauthorized
            if(res.getStatusCode() == 401) {
                throw new JIRAException('Unauthorized');
            }
            available = res.getStatusCode() != 200;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        } 

        return available;
    }

    @AuraEnabled
    public static Boolean createProject(String key, String projectName, Id accId, Id userId){
        
        Account acc = new Account();
        acc.id = accId;
        acc.JIRA_Project_Key__c = key;
        acc.JIRA_Project_Name__c = projectName;
        acc.JIRA_Project_Lead__c = userId;
        User u = [SELECT Id, JIRA_User_Id__c FROM User WHERE Id =: userId];
        String projectLeadId = u.JIRA_User_Id__c;
        Boolean success = false;
        try {
            JIRAProjectHelper.createOrUpdateProject(acc, projectLeadId);
            update acc;
            success = true;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return success;
    }
}