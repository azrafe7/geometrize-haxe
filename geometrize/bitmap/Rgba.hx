package geometrize.bitmap;

#if hxPixels
  typedef Rgba = geometrize.bitmap.hxPixels.Rgba;
#else
  typedef Rgba = geometrize.bitmap.geometrize.Rgba;
#end