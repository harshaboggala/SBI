public class Address_Picklist {
	public map<String,String> addMap;
    public String selected 	{set;get;}
    public Boolean flag		{set;get;}
    public String result	{set;get;}
    public list<selectOption> options {set;get;}
    public Address_Picklist(){
        flag=false;
        addMap=new map<String,String>();
        options=new list<selectOption>();
        addMap.put('-Select-','Select');
        addMap.put('Palamaner','1-49/1, Gollapalli villege, Kolamasanapalli Post, Palamaner Mandal, Chittoor District, AndhraPradesh, 517432');
        addMap.put('Tirupati','1-222/5, yarramitta, Leelamahal circle, Tirupati, Chittoor, AndhraPradesh, 517504');
        addMap.put('Nandyal','9-52/6, Madharterissa street, NGOs colony, Nandyal, Karnool, AndhraPradesh, 516524');
    	for(String s: addMap.keySet()){
            selectOption so=new selectOption(addMap.get(s),s);
            System.debug(s);
            options.add(so);
        } System.debug(options.size());
    }
    public void invoke(){
        
        if(selected!='Select'){
            flag=true;
            result=selected;
        }else {
            flag=false;
        }
    }
}