public class inbound_Email_Example implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail mail, Messaging.InboundEnvelope env){
     String subject=mail.subject;
     String fromAdd=mail.fromAddress;
     String body=mail.plainTextBody;
     messaging.InboundEmail.binaryAttachment[] files=mail.binaryAttachments;
     messaging.InboundEmailResult result=new messaging.InboundEmailResult();
    Contact con=[select id from Contact where email=:fromAdd limit 1];
        try{
            case c=new case();
            c.subject=subject;
            c.Status='New';
            c.priority='High';
            c.ContactId=con.id;
            c.Description=body;
            c.Origin='Email';
            insert c;
        
        list<Attachment> docs=new list<Attachment>();
        for(messaging.InboundEmail.binaryAttachment mib: files){
            Attachment ac=new Attachment();
            ac.ParentId=c.id;
            ac.Body=mib.body;
            ac.Name=mib.filename;
            docs.add(ac);
            result.success=true;
        	}
            insert docs;
            result.success=true;
        }catch(exception e){
            result.success=false;
        }
        return result;
    }

}