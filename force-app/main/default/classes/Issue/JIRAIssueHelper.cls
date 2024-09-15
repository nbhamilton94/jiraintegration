public with sharing class JIRAIssueHelper {
    List<Case> cases;
    public Integer totalCount {get;set;}
    Map<String, String> params;
    
    public JIRAIssueHelper(Map<String, String> params) {
        this.params = params; 
    }

    public void getIssues() {
        HttpResponse res = JiraCallout.getIssues(params);

        if(res.getStatusCode() != 200) {
            throw new JIRAException('Could not retrieve issues');
        }

        JIRAIssueQueryJSON query = JIRAIssueQueryJSON.parse(res.getBody());
        System.debug('QUERY:');
        System.debug(query);
        cases = JIRAIssueMapping.mapIssuesToCases(query);
        totalCount = query.total;
    }

    public void updateCases(){
        Database.UpsertResult[] results = Database.upsert(cases, Case.JIRA_Issue_Id__c, false);

        for(Database.UpsertResult result : results) {
            if(!result.isSuccess()) {
                System.debug(result.getErrors());
            } else {
                System.debug('"RESULT: "');
                System.debug(result); 
            }
        }
    }    
}