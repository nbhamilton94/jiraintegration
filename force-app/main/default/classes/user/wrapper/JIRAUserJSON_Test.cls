//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

@IsTest
public class JIRAUserJSON_Test {
	
	public static String json = '['+
	'    {'+
	'        \"self\": \"https://nbhamilton94.atlassian.net/rest/api/3/user?accountId=70121:191c7229-9790-4fb2-b931-fc8688d4e865\",'+
	'        \"accountId\": \"test-user-id\",'+
	'        \"accountType\": \"atlassian\",'+
	'        \"emailAddress\": \"nbhamilton94@gmail.com\",'+
	'        \"avatarUrls\": {'+
	'            \"48x48\": \"https://secure.gravatar.com/avatar/e790eef05480959ddbb08aede0f9dee6?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FNH-2.png\",'+
	'            \"24x24\": \"https://secure.gravatar.com/avatar/e790eef05480959ddbb08aede0f9dee6?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FNH-2.png\",'+
	'            \"16x16\": \"https://secure.gravatar.com/avatar/e790eef05480959ddbb08aede0f9dee6?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FNH-2.png\",'+
	'            \"32x32\": \"https://secure.gravatar.com/avatar/e790eef05480959ddbb08aede0f9dee6?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FNH-2.png\"'+
	'        },'+
	'        \"displayName\": \"Norman Hamilton\",'+
	'        \"active\": true,'+
	'        \"timeZone\": \"America/Chicago\",'+
	'        \"locale\": \"en_US\"'+
	'    }'+
	']';
	static testMethod void testParse() {

		List<JIRAUserJSON> obj = JIRAUserJSON.parse(json);
		System.assert(obj != null);
	}
}