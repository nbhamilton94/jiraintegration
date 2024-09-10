Account acc = [SELECT Id, JIRA_Project_Id__c, JIRA_Project_Key__c, JIRA_Project_Name__c FROM Account WHERE Id = '001aj00000WpbzBAAR'];

JIRAProjectHelper.createOrUpdateProject(acc, '70121:191c7229-9790-4fb2-b931-fc8688d4e865');