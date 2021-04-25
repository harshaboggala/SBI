public class light_Interest {
	@auraEnabled
    public static Integer show(integer amount,integer rate,integer years){
        return amount*years*rate/100;
    }
}