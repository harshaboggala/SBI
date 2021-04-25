public class outBound {
    public void invoke(){
        String[] mailId=new String[]{'bhanuprakashbhanu07@gmail.com'};
        String[] ccId=new String[]{'bhanuprakashb63@gmail.com'};
        String body='<h2>dear customer,</br> your account is under process</br> Thank you</br> Salesforce Team</h2>';
        pageReference p=page.bhanu;
        Blob prakash=p.getContentAsPDF();
        messaging.EmailFileAttachment efa=new messaging.EmailFileAttachment();
        efa.setFileName('bhanu.pdf');
        efa.setBody(prakash);
        messaging.EmailFileAttachment[] fileList=new messaging.EmailFileAttachment[]{efa};
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(mailId);
        msg.setCcAddresses(ccId);
        msg.setSubject('Outbound Mial Testing');
        msg.setHtmlBody(body);
        msg.setSenderDisplayName('Bhanu');
        msg.setFileAttachments(fileList);
        messaging.Email[] emails=new messaging.Email[]{msg};
        messaging.sendEmail(emails);
    }
}