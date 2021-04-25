@isTest
public class Oauth_ExmpTest {
	@isTest
    public static void aaa(){
        Oauth_ExmpTestDummy a=new Oauth_ExmpTestDummy();
        Test.setMock(HttpCalloutMock.class, a);
        Oauth_Exmp b=new Oauth_Exmp();
        b.callme();
        //System.assertEquals(b.token,b.token);
    }
}