public class Multiple_Records_Insert {
    public list<Student__c> stdList		{set;get;}
    public Multiple_Records_Insert(){
        stdList=new list<Student__c>();
        Student__c st=new Student__c();
        stdList.add(st);
    }
    public pageReference newRow(){
        Student__c st=new Student__c();
        stdList.add(st);
        return null;
    }
    public void save(){
        insert stdList;
        stdList.clear();
        Student__c st=new Student__c();
        stdList.add(st);
    }
    public void cancel(){
        stdList.clear();
        Student__c st=new Student__c();
        stdList.add(st);
    }
}