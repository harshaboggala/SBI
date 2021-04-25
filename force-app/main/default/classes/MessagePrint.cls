public class MessagePrint {
    public string name {set;get;}
    public integer age {set;get;}
    public void invoke(){
        if(name!='' && age>=18){
            ageSuccess();
        }
        else if(name==''){
            nameError();
        }
        else if(age==0){
            noage();
        }
        else if(age<=17){
            ageError();
        }
    }
    public void nameError(){
        Apexpages.Message msg=new Apexpages.Message(Apexpages.severity.Error,'must enter name');
        Apexpages.addMessage(msg);
    }
    public void ageError(){
        Apexpages.Message msg=new Apexpages.Message(Apexpages.severity.Error,'your age is less than 18');
        Apexpages.addMessage(msg);
    }

public void noage(){
        Apexpages.Message msg=new Apexpages.Message(Apexpages.severity.Error,'enter your age');
        Apexpages.addMessage(msg);
    }

public void ageSuccess(){
        Apexpages.Message msg=new Apexpages.Message(Apexpages.severity.CONFIRM,'you are eligible');
        Apexpages.addMessage(msg);
    }

}