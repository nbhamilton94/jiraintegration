//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

@IsTest
public class JIRAVersionJSON_Test {
	public static String json = '{'+
    '  \"archived\": false,'+
    '  \"description\": \"An excellent version\",'+
    '  \"name\": \"New Version 1\",'+
    '  \"projectId\": 10000,'+
    '  \"id\": 10000,'+
    '  \"releaseDate\": \"2010-07-06\",'+
    '  \"released\": true'+
    '}';

	static testMethod void testParse() {
		JIRAVersionJSON obj = JIRAVersionJSON.parse(json);
		System.assert(obj != null);
	}
}