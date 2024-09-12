@isTest
public class JIRAProjectTest {

    private class Mock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            if (req.getEndpoint().endsWith('project')) {
                res.setBody(JIRAProjectJSON_Test.json);
                res.setStatusCode(201);
            } else if (req.getEndpoint().contains('project/')) {
                res.setBody(JIRAProjectJSON_Test.json);
                res.setStatusCode(200);
            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
            return res;
        }
    }

    @TestSetup
    static void makeData(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];

        User u = new User(Alias = 'standt', Email='norm+nbhamilton94@gmail.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id, TimeZoneSidKey='America/Los_Angeles',
        UserName='norm+nbhamilton94@gmail.com');

        insert u;
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.JIRA_Project_Lead__c = u.Id;
        insert acc;         
    }

    @isTest(seeAllData=false)
    static void testController() {
        Test.setMock(HttpCalloutMock.class, new Mock());
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account'];
        ApexPages.StandardController stdController = new ApexPages.StandardController(acc);
        
        JIRAProjectController controller = new JIRAProjectController(stdController);
        Test.startTest();
        controller.createProject();
        Test.stopTest();

        Account afterUpdate = [SELECT Id, JIRA_Project_Id__c FROM Account WHERE Id =: acc.id];

        System.assert(String.isNotBlank(afterUpdate.JIRA_Project_Id__c), 'JIRA Project Id Never Set');
    }

    //adding test methods for our methods from the lightning project wizard
    @isTest(seeAllData=false)
    static void testCheckKey(){
        Test.setMock(HttpCalloutMock.class, new Mock());
        Test.startTest();
        Boolean available = JiraProjectWizardController.checkJiraKeyAvailable('KEY');
        Test.stopTest();
        System.assert(!available, 'key should not be available');
    }

    
}