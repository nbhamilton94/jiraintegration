public with sharing class JiraCallout {

    /**
     * @param endpoint 'projects'
     * @param method GET
     * @param body {"key" :"value"}
     */

    private static HttpResponse httpHelper(String endpoint, String method, String body){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        if(body != null){
            req.setBody(body);
            req.setHeader('Content-Type', 'application/json');
        }

        req.setMethod(method);
        req.setEndpoint('callout:Jira/'+ endpoint);

        HttpResponse res = h.send(req);
        System.debug(res.getBody());

        return res;
    }

    /**\
     * @param key Project key. Example: ACME 
     */    
    public static HttpResponse getProject(String key){
        return httpHelper('project/' + key, 'GET', null);
    }

    /**\
     * @param body Request body for /project endpoint 
     */    
    public static HttpResponse createProject(String body){
        return httpHelper('project', 'POST', body);
    }

    /**\
     * @param projectId Jira Project Id or project key
     * @param body Request body for /project endpoint 
     */    
    public static HttpResponse updateProject(String projectId, String body){
        return httpHelper('project/' + projectId, 'PUT', body);
    }
    
    /** 
     * @param email Jira user's email address
     * 
    */
    public static HttpResponse getUser(String email){
        return httpHelper('user/search?query='+ email, 'GET', null);
    }

    /**
     * @param version Jira version data
     * 
     */
     public static HttpResponse createVersion(String version){
        return httpHelper('version', 'POST', version);
     }

    /**
     * @param params Jira Issue search query parameters
     * the reason taking a map is to dynamically give URl parameters based on the map of parameters to values
     */
     public static HttpResponse getIssues(Map<String, String> params){
        String endpoint = 'search?';
        for(String key: params.keySet()){
            endpoint += key + '=' + params.get(key) + '&';
        }

        return httpHelper(endpoint, 'GET', null);
     }
}