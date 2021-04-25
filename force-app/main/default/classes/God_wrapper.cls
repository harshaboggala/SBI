public class God_wrapper{
    	public String Status		{set;get;}	
	    public String Id			{set;get;}	
		public String Name			{set;get;}	
		public String Gender		{set;get;}	
		public String ContactNo		{set;get;}	
		public String Location		{set;get;}	
		public List<FamilyMember> fm {set;get;}
	
	class FamilyMember {
		public String Id			{set;get;}	
		public String Name			{set;get;}	
		public String Relation		{set;get;}	
	}
	
}