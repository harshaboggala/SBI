trigger Student_Book_Trigger on Student__c (after update) {
map<id,Student__c> stdMap=trigger.newMap;
set<id> sid=stdMap.keySet();
list<Student__c> stdList=[SELECT id,name,Student_Status__c FROM Student__c WHERE Student_Status__c = 'Lost' and id in :sid ];
list<Book__c> bookList=[Select id,Student_books__c from Book__c];
list<Book__c> bList=new list<Book__c>();
    for(Student__c s:stdList){
        for(Book__c b: bookList){
            if(b.Student_books__c==s.id){
            bList.add(b);
            }
        }
    }
    if(bList.size()>0){ 
    delete bList;
    }
}