public class CalendarMonth {
    @AuraEnabled
    public static Map < String, String > showCalName() {
        Map < String, String > intergerName = new Map < String, String >();
        intergerName.put('1', 'Jan');
        intergerName.put('2', 'Feb');
        intergerName.put('3', 'Mar');
        intergerName.put('4', 'Apr');
        intergerName.put('4', 'Apr');
        return intergerName;
    }
}