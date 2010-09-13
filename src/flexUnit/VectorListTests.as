package flexUnit
{
	import almerblank.flex.utils.vector.VectorList;
	
	import flexunit.framework.Assert;
	
	import mx.events.PropertyChangeEvent;
	
	import org.flexunit.async.Async;
	/**
	 * Tests for the VectorList class.
	 * 
	 * @author Omar Gonzalez
	 * 
	 */	
	public class VectorListTests
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
		
		[Test(order="1")]
		/**
		 * Tests constructing the VectorList object
		 * 
		 */		
		public function testVectorList():void
		{
			var vectorList:VectorList;
			try
			{
				var vect:Vector.<String> = new Vector.<String>();
				vectorList = new VectorList(vect);
			} catch (e:Error) {}
			
			Assert.assertNotNull(vect);
			Assert.assertTrue(vectorList is VectorList);
		}
		[Test(order="2")]
		/**
		 * Tests the addAll() method, items should be added to the
		 * end of the current list.
		 * 
		 */
		public function testAddAll():void
		{
			var itemsToAdd:Vector.<String> = new Vector.<String>();
				itemsToAdd.push("three");
				itemsToAdd.push("four");
			var itemsList:VectorList = new VectorList(itemsToAdd);
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push("two");
			var itemToAdd:String = "itemAt";
			var vectorList:VectorList = new VectorList(vect);
				vectorList.addAll(itemsList);
			Assert.assertTrue(vect[2] === "three");
			Assert.assertTrue(vect[3] === "four");
		}
		[Test(order="3")]
		/**
		 * Tests the addAllAt() method, items should be added
		 * to the current list at the specified index.
		 * 
		 */
		public function testAddAllAt():void
		{
			var itemsToAdd:Vector.<String> = new Vector.<String>();
				itemsToAdd.push("three");
				itemsToAdd.push("four");
			var itemsList:VectorList = new VectorList(itemsToAdd);
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push("two");
			var itemToAdd:String = "itemAt";
			var vectorList:VectorList = new VectorList(vect);
				vectorList.addAllAt(itemsList, 0);
			Assert.assertTrue(vect[0] === "three");
			Assert.assertTrue(vect[1] === "four");
		}
		[Test(order="4")]
		/**
		 * Tests the addItem() method, the item should be 
		 * added to the end of the current list.
		 * 
		 */
		public function testAddItem():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push("two");
			var itemToAdd:String = "itemAt";
			var vectorList:VectorList = new VectorList(vect);
				vectorList.addItem(itemToAdd);
			Assert.assertTrue(vect[2] === itemToAdd);
		}
		[Test(order="5")]
		/**
		 * Tests the addItemAt() method, the item should be
		 * added at the specified index.
		 * 
		 */
		public function testAddItemAt():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push("two");
			var itemToAdd:String = "itemAt";
			var vectorList:VectorList = new VectorList(vect);
				vectorList.addItemAt(itemToAdd, 1);
			Assert.assertTrue(vect[1] === itemToAdd);
		}
		[Test(order="6")]
		/**
		 * Tests the getItemAt() method, the expected item should
		 * be retrieved when using a certain index specified to the
		 * getItemAt() method.
		 * 
		 */
		public function testGetItemAt():void
		{
			var getIndexOf:String = "two";
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push(getIndexOf);
			var vectorList:VectorList = new VectorList(vect);
			Assert.assertTrue(vectorList.getItemAt(1) === getIndexOf);
		}
		[Test(order="7")]
		/**
		 * Tests the getItemIndex(), the item should return
		 * the expected index in the Vector object.
		 * 
		 */
		public function testGetItemIndex():void
		{
			var getIndexOf:String = "two";
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("one");
				vect.push(getIndexOf);
			var vectorList:VectorList = new VectorList(vect);
			Assert.assertTrue(vectorList.getItemIndex(getIndexOf) == 1);
		}
		[Test(async, timeout="1000", order="8")]
		/**
		 * Tests monitoring of properties on objects in the list.  If a property
		 * within the list that is bindable changes the VectorList
		 * should dispatch a PropertyChangeEvent.PROPERTY_CHANGE event.
		 * 
		 */
		public function testItemUpdated():void
		{
			var vect:Vector.<DataVO> = new Vector.<DataVO>();
			var anObject:DataVO = new DataVO();
				anObject.someProperty = "blah";
				vect.push(anObject);
			var vectorList:VectorList = new VectorList(vect);
			Async.handleEvent(this, vectorList, PropertyChangeEvent.PROPERTY_CHANGE, _handlePropertyChange, 1000, vect);
			anObject.someProperty = "edited"
		}
		/**
		 * Assertions for the testItemUpdated() test.
		 * 
		 * @param event
		 * @param param2
		 * 
		 */
		private function _handlePropertyChange(event:PropertyChangeEvent, param2:*):void
		{
			var vect:Vector.<DataVO> = param2 as Vector.<DataVO>;
			Assert.assertNotNull(vect);
			Assert.assertTrue(vect[0].someProperty == "edited");
		}
		[Test(order="9")]
		/**
		 * Tests the length getter for the VectorList, it should
		 * return the expected length, equal to the source Vector.
		 * 
		 */
		public function testGet_length():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("two");
				vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
			Assert.assertTrue(vect.length == vectorList.length);
		}
		[Test(order="10")]
		/**
		 * Tests removing all items  using the removeAll() method.
		 * 
		 */
		public function testRemoveAll():void
		{
			var vect:Vector.<String> = new Vector.<String>();
			vect.push("two");
			vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
			vectorList.removeAll();
			Assert.assertTrue(vect.length == 0);
		}
		[Test(order="11")]
		/**
		 * Tests removing a specific item using the removeItem() method.
		 * 
		 */
		public function testRemoveItem():void
		{
			var itemToRemove:String = "two";
			var vect:Vector.<String> = new Vector.<String>();
				vect.push(itemToRemove);
				vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
				vectorList.removeItem(itemToRemove);
			Assert.assertTrue(vect.length == 1);
			Assert.assertTrue(vect[0] == "one");
		}
		[Test(order="12")]
		/**
		 * Tests removing an item at a specified index using 
		 * the removeItemAt() method.
		 * 
		 */
		public function testRemoveItemAt():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("two");
				vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
				vectorList.removeItemAt(1);
			Assert.assertTrue(vect.length == 1);
			Assert.assertTrue(vect[0] == "two");
		}
		[Test(order="13")]
		/**
		 * Tests the setItemAt() method, the item set should replace
		 * the item currently at the specified index.
		 * 
		 */
		public function testSetItemAt():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("two");
				vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
				vectorList.addItemAt("three",1);
			Assert.assertTrue(vect[1] === "three");
			Assert.assertTrue(vect.length == 3);
		}
		[Test(order="14")]
		/**
		 * Tests the source getter and setter functions.
		 * 
		 */
		public function test_source():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("two");
				vect.push("one");
			var vectorList:VectorList = new VectorList(new Vector.<String>());
				vectorList.source = vect;
			Assert.assertTrue(vectorList.source === vect);
		}
		[Test(order="15")]
		/**
		 * Tests the toArray() method.
		 * 
		 */
		public function testToArray():void
		{
			var vect:Vector.<String> = new Vector.<String>();
				vect.push("two");
				vect.push("one");
			var vectorList:VectorList = new VectorList(vect);
			Assert.assertTrue(vectorList.toArray() is Array);
			Assert.assertTrue(vectorList.toArray().toString() == "two,one");
		}
		[Test(order="16")]
		/**
		 * Tests the uid getter and setter methods.
		 * 
		 */
		public function test_uid():void
		{
			var vect:Vector.<String> = new Vector.<String>();
			var vectorList:VectorList = new VectorList(vect);
			var uid:String = "randomUid";
			vectorList.uid = uid;
			Assert.assertTrue(uid == vectorList.uid);
		}
	}
}
/**
 * Helper class for the testItemUpdated() test.
 * 
 * @author omargonzalez
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