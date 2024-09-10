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
}