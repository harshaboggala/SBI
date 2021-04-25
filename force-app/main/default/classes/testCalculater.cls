@isTest
public class testCalculater {
    @isTest
    private static void callout(){
        Calculate c=new Calculate();
        c.a=20;
        c.b=40;
        c.add();
        System.assertEquals(60, c.c);
        c.mul();
        System.assertEquals(800, c.c);
        c.reset();
        System.assertEquals(0, c.a);
        System.assertEquals(0, c.b);
        System.assertEquals(0, c.c);
    }
}