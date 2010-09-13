package almerblank.flex.utils.vector
{
	import almerblank.flex.utils.vector.VectorList;
	
	import mx.collections.IList;
	import mx.collections.ListCollectionView;
	
	/**
	 * The VectorCollection class allows you to use Vector type
	 * objects as dataProvider sources for List type components.
	 * 
	 * @author Omar Gonzalez :: omar@almerblank.com :: http://labs.almerblank.com
	 * 
	 */	
	public class VectorCollection extends ListCollectionView
	{
		/**
		 * Release version, used for reference.
		 */
		static private const _VERSION:String = "1.0";
		/**
		 * @Constructor
		 * 
		 * @param vector
		 * 
		 */
		public function VectorCollection(vector:Object=null)
		{
			super();
			
			source = vector;
		}
		/**
		 * Returns the source object for the VectorCollection
		 * 
		 * @return 
		 * 
		 */
		public function get source():Object
		{
			if (list && list is VectorList)
				return VectorList(list).source;
			
			return null;
		}
		/**
		 * Sets the Vector source object for the VectorCollection
		 * 
		 * @param value
		 * 
		 */
		public function set source(value:Object):void
		{
			list = new VectorList(value);
		}

	}
}