public class Calculate {
    public integer a{set;get;}
    public integer b{set;get;}
    public integer c{set;get;}
    public void add(){
        c=a+b;
    }
    public void mul(){
        c=a*b;
    }
    public void reset(){
        a=0;
        b=0;
        c=0;
    }
}