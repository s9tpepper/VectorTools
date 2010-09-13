package flexUnit
{
	import almerblank.flex.utils.vector.VectorUtil;
	
	import flash.utils.Dictionary;
	
	import flexunit.framework.Assert;
	
	public class VectorUtilTests
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
		 * Tests converting a Vector object to an Array.
		 * 
		 */
		public function testToArray():void
		{
			var vector:Vector.<String> = new Vector.<String>();
				vector.push("one");
				vector.push("two");
			var array:Array = VectorUtil.toArray(vector);
			Assert.assertTrue(array is Array);
			Assert.assertEquals("one,two", array.toString());
		}
		
		[Test]
		/**
		 * Tests convertin a vector to a dictionary.
		 * 
		 */
		public function testToDictionary():void
		{
			// Tests using default key "index"
			var vector:Vector.<String> = new Vector.<String>();
				vector.push("one");
				vector.push("two");
			var dict:Dictionary = VectorUtil.toDictionary(vector);
			Assert.assertTrue(dict is Dictionary);
			Assert.assertTrue(dict[0] === "one");
			Assert.assertTrue(dict[1] === "two");
			
			// Tests using custom key
			var vector2:Vector.<DataVO> = new Vector.<DataVO>();
			var data:DataVO = new DataVO();
				data.someProperty = "one";
			vector2.push(data);
				
			data = new DataVO();
			data.someProperty = "two";
			vector2.push(data);
			var dict2:Dictionary = VectorUtil.toDictionary(vector2, "someProperty");
			Assert.assertTrue(dict2["two"] === data);
		}
	}
}
/**
 * Helper class for the testToDictionary() test.
 * 
 * @author Omar Gonzalez
 * 
 */
class DataVO
{
	[Bindable]
	public var someProperty:String;
	
	public function DataVO()
	{
	}
}