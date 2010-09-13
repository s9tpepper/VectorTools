package flexUnit
{
	import almerblank.flex.utils.vector.VectorCollection;
	
	import flexunit.framework.Assert;
	/**
	 * Tests for the VectorCollection class.
	 * 
	 * @author Omar Gonzalez
	 * 
	 */
	public class VectorCollectionTests
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		/**
		 * Tests the source getter and setter functions.
		 * 
		 */
		public function testSource():void
		{
			var vector:Vector.<String> = new Vector.<String>();
				vector.push("test");
			var vc:VectorCollection = new VectorCollection(new Vector.<String>());
				vc.source = vector;
			Assert.assertTrue(vector === vc.source);
		}
	}
}