public class JIRAIssueBatch implements Database.Batchable<sObject>, Database.AllowsCallouts, Schedulable {

    public void execute(SchedulableContext SC){
        JIRAIssueBatch batch = new JIRAIssueBatch();
        Database.executeBatch(batch);
    }

    public Database.QueryLocator start(Database.BAtchableContext BC){
        //This is just a hack to schedule classes that call out to 3rd party systems
        return Database.getQueryLocator([SELECT Id FROM Account LIMIT 1]);
    }

    //next we want to implement the execute method for the batch class
    public void Execute(Database.BatchableContext BC, List<Account> accList){
        //Get Cases
        Map<String, String> params = new Map<String, String>();

        String jql = 'updated >= -1d ORDER BY created DESC'; //Get issues updated in the last day

        params.put('jql', EncodingUtil.urlEncode(jql, 'UTF-8'));
        params.put('maxresults', '100');

        JIRAIssueHelper issues = new JIRAIssueHelper(params);
        issues.getIssues();
        issues.updateCases();
    }

    public void finish(Database.BatchableContext BC){
        System.debug('Finished');
    }
}