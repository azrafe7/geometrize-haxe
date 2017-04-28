package geometrize.bitmap;

#if hxPixels
  typedef Bitmap = geometrize.bitmap.hxPixels.Bitmap;
#else
  typedef Bitmap = geometrize.bitmap.geometrize.Bitmap;
#end