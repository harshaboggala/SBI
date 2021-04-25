@isTest
public class selectOptionTest {
	@isTest
    private static void testme(){
        select_option s=new select_option();
        s.selected='karnataka';
        s.call();
        System.assertEquals(s.result, 'you are selected:kannada');
        
    }
}