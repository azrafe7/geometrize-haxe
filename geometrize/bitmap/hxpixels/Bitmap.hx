package geometrize.bitmap.hxPixels;

import hxPixels.Pixels;
import haxe.io.Bytes;

/**
 * Helper class for working with bitmap data.
 * @author Sam Twidale (http://samcodes.co.uk/)
 */
class Bitmap {
  
  @:keep
  static var _init:Bool = {
    trace("using hxPixels.Bitmap");
    return true;
  }
  
	/**
	 * The width of the bitmap.
	 */
	public var width:Int;
	/**
	 * The height of the bitmap.
	 */
	public var height:Int;
	/**
	 * The bitmap data.
	 */
	private var data:Pixels;
	
	/**
	 * Creates a new bitmap, filled with the given color.
	 * @param	w		The width of the bitmap.
	 * @param	h		The height of the bitmap.
	 * @param	color	The starting background color of the bitmap.
	 * @return	The new bitmap.
	 */
	public static inline function create(w:Int, h:Int, color:Rgba):Bitmap {
		var bitmap = new Bitmap();
		bitmap.width = w;
		bitmap.height = h;
		bitmap.data = new Pixels(w, h, true);
    bitmap.fill(color);
		return bitmap;
	}
	
	/**
	 * Creates a new bitmap from the supplied byte data.
	 * @param	w		The width of the bitmap.
	 * @param	h		The height of the bitmap.
	 * @param	bytes	The byte data to fill the bitmap with, must be width * height * depth long.
	 * @return	The new bitmap.
	 */
	public static inline function createFromBytes(w:Int, h:Int, bytes:Bytes):Bitmap {
		var bitmap = new Bitmap();
		Sure.sure(bytes != null);
		Sure.sure(bytes.length == w * h * 4); // Assume 4-byte RGBA8888 pixel format
		bitmap.width = w;
		bitmap.height = h;
		bitmap.data = Pixels.fromBytes(bytes, w, h);
		return bitmap;
	}
	
	/**
	 * Gets a pixel at the given coordinate.
	 * @param	x	The x-coordinate.
	 * @param	y	The y-coordinate.
	 * @return	The pixel color value.
	 */
	public inline function getPixel(x:Int, y:Int):Rgba {
		return data.getPixel32(x, y);
	}
	
	/**
	 * Sets a pixel at the given coordinate.
	 * @param	x	The x-coordinate.
	 * @param	y	The y-coordinate.
	 * @param	color	The color value to set at the given coordinate.
	 */
	public inline function setPixel(x:Int, y:Int, color:Rgba):Void {
		data.setPixel32(x, y, color);
	}
	
	/**
	 * Makes a deep copy of the bitmap data.
	 * @return	The deep copy of the bitmap data.
	 */
	public inline function clone():Bitmap {
		trace('clone');
		var bitmap = new Bitmap();
		bitmap.width = width;
		bitmap.height = height;
		bitmap.data = this.data.clone();
		return bitmap;
	}
	
	/**
	 * Fills the bitmap with the given color.
	 * @param	color The color to fill the bitmap with.
	 */
	public inline function fill(color:Rgba):Void {
		this.data.fillRect(0, 0, width, height, color);
	}
	
	/**
	 * Gets the raw bitmap data bytes.
	 * @return	The bitmap data.
	 */
	public inline function getBytes():Bytes {
    return this.data.bytes;
	}
	
	/**
	 * Private constructor.
	 */
	private function new():Void {
		// No implementation
	}
}