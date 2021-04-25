public class map_map {
    public list<String> sts=new list<String>{'Andhrapradesh','telangana','Kerala','Karnataka','Tamilnadu'};
    public list<wrap> masterList=new list<wrap>();
    public map_map(){}
    public void callme(){
   		list<String> tgDist=new list<String>{'Srikakulam','Mahabubnagar','Karimnagar','Sikindharabad','Hyderabad'};
        list<String> apDist=new list<String>{'Chittoor','Karnool','Kadapa','Prakasham','Anantapur'};
        list<String> klDist=new list<String>{'thiruvananthapuram','kochi','tutikoran'};
        list<String> knDist=new list<String>{'misore','udipi','mangalore','ballari'};
        list<String> tnDist=new list<String>{'chennai','velore','kanchi','madurai'};
        wrap w1=new wrap();
    	wrap w2=new wrap();
        wrap w3=new wrap();
        wrap w4=new wrap();
        wrap w5=new wrap();
        w1.Dist=apDist;
        w2.Dist=tgDist;
        w3.Dist=klDist;
        w4.Dist=knDist;
        w5.Dist=tnDist;
    	masterList.add(w1);
        masterList.add(w2);
        masterList.add(w3);
        masterList.add(w4);
        masterList.add(w5);
	map<String,wrap> map1=new map<String,wrap>();
        for(integer i=0;i<sts.size();i++){
            map1.put(sts[i],masterList[i]);
        }
        //System.debug(map1.get('Andhrapradesh'));
    map<String,map<String,wrap>> map2=new map<String,map<String,wrap>>();
        for(integer i=0;i<sts.size();i++){
            //map<String,wrap> samp=new map<String,wrap>{sts[i]=>map1.get(sts[i])};
            map2.put(sts[i],new map<String,wrap>{sts[i]=>map1.get(sts[i])});
            //wrap res=map2.get(sts[i]).get(sts[i]);
        }
        System.debug('call me'+map2);
    }
}