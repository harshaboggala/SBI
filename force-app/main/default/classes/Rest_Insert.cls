@RestResource(urlmapping='/createOpportunity/*')
global class Rest_Insert {
    @HttpPost
    global static string create(String Name, String Stage, String CloseDate){
        String result;
        //Date cDate=Date.parse(CloseDate);
        System.JSONGenerator json=JSON.createGenerator(true);
        json.writeStartObject();
        try{
            Opportunity opty=new Opportunity();
            opty.Name=Name;
            opty.StageName=Stage;
            opty.CloseDate=Date.parse(CloseDate);
            insert opty;
            json.writeStringField('Status','Success');
            json.writeStringField('Id',opty.id);
        }
        catch(Exception e){
            json.writeStringField('Status','Insertion Failed');
            json.writeStringField('Error',e.getTypeName());
        }
        json.writeEndObject();
        result=json.getAsString();
        return result;
    }
}