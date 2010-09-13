package flexUnit
{
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	/**
	 * Tests for the VectorTools library.
	 * 
	 * @author Omar Gonzalez
	 * 
	 */	
	public class VectorToolsTestSuite
	{
		/**
		 * Tests for the VectorCollection class.
		 */
		public var vectorCollectionTests:VectorCollectionTests;
		/**
		 * Tests for the VectorList class.
		 */		
		public var vectorListTests:VectorListTests;
		/**
		 * Tests the vector utils test.
		 */		
		public var vectorUtilTests:VectorUtilTests;
	}
}