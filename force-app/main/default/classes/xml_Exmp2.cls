public class xml_Exmp2 {
    public String xmlString			{set;get;}
    public xml_Exmp2(){
        List<Account> accList=[select name,Industry,(select Lastname,Firstname from Contacts) from Account where name='Genepoint'];
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('Accounts',null,null);
        if(accList.size()>0){
            for(Account a: accList){
        		root.setAttribute('name',a.name);
        		//Dom.XmlNode Cont=root.addChildElement('Contact',null,null);
            }
        }
        xmlString=doc.toXmlString();
    }
}