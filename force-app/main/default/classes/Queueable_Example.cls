public class Queueable_Example implements Queueable{
    public void execute(QueueableContext qc){
        list<Opportunity> opp=new list<Opportunity>();
        list<Opportunity> Opty=[select id,StageName from Opportunity where StageName='Needs Analysis'];
        for(Opportunity op: opty){
            op.StageName='closed Won';
            opp.add(op);
        }
        update opp;
    }
}