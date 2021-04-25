public class countryCodes {
    public list<String> countries=new list<String>{'--Select--','India','Russia','chaina','USA','Pakistan','Nepal','Singapur','Switzerland','Sweeden'};
   	public list<String> codes=new list<String>{'select','+91','+7','+86','+1','+92','+977','+65','+41','+46'};
    public String selected {set;get;}
    public list<selectOption> options {set;get;}
    public String result {set;get;}
    public boolean flag {set;get;}
    
    public countryCodes(){
        
        options=new list<selectOption>();
        System.debug(countries.size());
        for(integer i=0;i<countries.size();i++){
            SelectOption op=new SelectOption(codes[i],countries[i]);
            System.debug(codes[i]);
            options.add(op);
        }
        
    }
    public pageReference callme(){
        if(selected=='select'){
        flag=false;
            result=selected;
        } else{
            flag=true;
            result=selected;
        }
        return null;
    }
}