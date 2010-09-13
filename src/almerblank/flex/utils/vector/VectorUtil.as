package almerblank.flex.utils.vector
{
	import flash.utils.Dictionary;
	/**
	 * VectorUtil provides some utility methods for working with Vector objects.
	 * 
	 * @author Omar Gonzalez
	 * 
	 */
	public class VectorUtil
	{
		/**
		 * Release version, used for reference.
		 */
		static private const _VERSION:String = "1.0";
		/**
		 * Returns an Array object containing all of the items in the Vector.
		 * 
		 * @param vector
		 * @return 
		 * 
		 */
		static public function toArray(vector:Object):Array
		{
			var array:Array = new Array();
			
			var vectorItem:Object;
			for each (vectorItem in vector)
			{
				array.push(vectorItem);
			}
			
			return array;
		}
		
		/**
		 * Turns a Vector object into a Dictionary object.  By default the Dictionary
		 * object will have the indices of the items as keys.  Alternatively, a custom
		 * key String can be set.  The method will look for that property in each object
		 * of the Vector and attempt to use that value on the object in the vector as
		 * the key in the Dictionary.
		 * 
		 * @param vector The source Vector object.
		 * @param key The key to use, if "index" the items index in the Vector will be used.
		 * @param weakKeys Used for the Dictionary instantiation to flag using weak references or not.
		 * @return Dictionary
		 * 
		 */
		static public function toDictionary(vector:Object, key:String = "index", weakKeys:Boolean=false):Dictionary
		{
			var dict:Dictionary = new Dictionary(weakKeys);
			var item:Object;
			for (var i:Number = 0; i < vector.length; i++)
			{
				item = vector[i];
				switch (key)
				{
					case "index":
						dict[i] = item;
						break;
					
					default:
						try
						{
							var dictKey:String = item[ key ];
							dict[dictKey] = item;
						}
						catch (e:Error)
						{
							dict[i] = item;
						}
						break;
				}
			}
			
			return dict;
		}
	}
}