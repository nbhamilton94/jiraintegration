public with sharing class JIRAProjectHelper {
    public static Account createOrUpdateProject(Account acc, String projectLeadId){
        JIRAProjectJSON proj = JIRAProjectMapping.mapAccountToProject(acc, projectLeadId);
        HttpResponse res; //= JiraCallout.createProject(JSON.serialize(proj, true));
        
        // Create if no Jira Id exists
        if(String.isBlank(acc.JIRA_Project_Id__c)) {
            res = JiraCallout.createProject(JSON.serialize(proj,true));    
        } else {
            res = JiraCallout.updateProject(acc.JIRA_Project_Id__c, JSON.serialize(proj, true));
        }

        if(res.getStatusCode() != 201 && res.getStatusCode() != 200){
            throw new JIRAException(res.getBody());
        }
        JIRAProjectJSON projResponse = JIRAProjectJSON.parse(res.getBody());
        acc.Jira_Project_Id__c = projResponse.id;
        return acc;
    }
}