public class Xml_Exmp {
    public String xmlString			{set;get;}
    public Xml_Exmp(){
        Dom.Document abc=new Dom.Document();
        Dom.XmlNode root=abc.createRootElement('Address',null,null);
        Dom.XmlNode City=root.addChildElement('City',null,null);
        City.addTextNode('Hyd');
        Dom.XmlNode PinCode=root.addChildElement('PinCode',null,null);
        PinCode.addTextNode('500123');
        Dom.XmlNode State=root.addChildElement('State',null,null);
        State.addTextNode('TG');
        xmlString=abc.toXmlString();
    }
}