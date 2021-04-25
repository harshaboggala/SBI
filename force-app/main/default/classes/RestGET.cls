@RestResource(urlmapping='/getAcounts/*')
global class RestGET {
    @HttpGet
    global static List<Account> read(){
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        Map<String,String> result=req.params;
        String acc=result.get('ac');
        List<Account> accList=[select Name,id,phone from Account where Name=:acc];
        return accList;
    }

}