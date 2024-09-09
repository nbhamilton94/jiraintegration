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
}