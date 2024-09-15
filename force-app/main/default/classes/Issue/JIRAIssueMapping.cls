public with sharing class JIRAIssueMapping {

    public static List<Case> mapIssuesToCases(JIRAIssueQueryJSON query){
        List<Case> cases = new List<Case>();
        Set<String> projectIds = new Set<String>();
        Set<String> versionIds = new Set<String>();

        //Below is considered the best practice for doing lookings in O(n) time.
        //Key: Jira Project ID, Value: Account Id
        Map<String, Id> accMap = new Map<String, Id>();

        //Key: Jira Version Id, Value: Opportunity Id
        Map<String, Id> oppMap = new Map<String, Id>();
        for(JIRAIssueQueryJSON.Issues issue : query.issues) {
            Case c = new Case();
            c.JIRA_Issue_Id__c = issue.id;
            c.Subject = issue.fields.summary;
            c.JIRA_Project_Id__c = issue.fields.project.id;
            projectIds.add(c.JIRA_Project_Id__c);
            System.debug('PROJECT IDS' + projectIds);
            c.JIRA_Key__c = issue.key;
            c.Status = issue.fields.status.name;
            c.Time_Spent__c = issue.fields.aggregatetimespent;
            if(issue.fields.fixVersions.size() > 0){ 
                c.JIRA_Version_Id__c = issue.fields.fixVersions[0].id;
                versionIds.add(c.JIRA_Version_Id__c);
            }
            cases.add(c);
        }

        List<Account> accs = [SELECT Id, JIRA_Project_Id__c FROM Account WHERE JIRA_Project_Id__c IN: projectIds];
        System.debug('LIST OF ACCOUNTS: ' + accs);

        for(Account acc : accs){
            accMap.put(acc.JIRA_Project_Id__c, acc.Id);
        }
        System.debug('ACCOUNT MAP: ' + accMap);

        List<Opportunity> opps = [SELECT Id, JIRA_Version_Id__c FROM Opportunity WHERE JIRA_Version_Id__c IN: versionIds];
        System.debug('LIST OF OPPORUNITIES: ' + opps);
        
        for(Opportunity opp: opps){
            oppMap.put(opp.JIRA_Version_Id__c, opp.Id);
        }

        System.debug('OPP MAP: ' + oppMap);
        for(Case c: cases){
            if(oppMap.containsKey(c.JIRA_Version_Id__c)){
                System.debug('OPP MAP CONTAINS KEY');
                c.Opportunity__c = oppMap.get(c.JIRA_Version_Id__c);
            } else {
                System.debug(' OPP MAP DOES NOT CONTAIN KEY');
            }
            
            if(accMap.containsKey(c.JIRA_Project_Id__c)){
                System.debug('ACCOUNT MAP CONTAINS KEY');
                c.AccountId = accMap.get(c.JIRA_Project_Id__c);
            } else {
                System.debug('ACCOUNT MAP DOES NOT CONTAIN KEY');
            }
        }

        return cases;
    }
}