public class select_option {
    public List<selectoption> options {set;get;}
    public string selected {set;get;}
    public string result{set;get;}
    public select_option(){
        options=new List<selectoption>();
        List<string> language=new List<string>{'none','telugu','kannada'};
        List<string> state=new List<string>{'none','andhra','karnataka'};
            for(string l: state ){
                SelectOption op=new SelectOption(l,l);
                options.add(op);
            }
            
    }
    public void call(){
        result='you are selected:'+selected;
    }
}