/+
MIT License
-----------

Copyright (c) 2020 Andrea Fontana (https://github.com/trikko/)
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
+/

module vec3;

import raylib : Vector3;

struct Vec3
{
	import std.traits: isNumeric;
   import core.simd;

   union 
   { 
      float[3] 	data = [0,0,0]; 
      struct 	   { float x; float y; float z; }
      Vector3     rlVector;
   }

   alias rlVector this;

   // Better avoid copy c-tors
   //@disable this(this); 
   
   this(in float x, in float y, in float z) 	{ this.data = [x,y,z]; }
   this(in float[] data) 				   { this.data[] = data[]; } 
   
   Vec3 opBinary(string op)(const ref Vec3 v) const if((op == "+") || (op == "-") || (op == "*") || (op == "/")) {
      Vec3 result;
      result.data[] = mixin("data[]" ~ op ~ "v.data[]");
      return result;
   }
   
   Vec3 opBinary(string op, T)(const T v) const if(((op == "+") || (op == "-") || (op == "*") || (op == "/")) && isNumeric!T) {
      Vec3 result;
      result.data[] = mixin("data[]" ~ op ~ "v"); 
      return result;
   }
   
   void opOpAssign(string op)(const ref Vec3 v) if((op == "+") || (op == "-") || (op == "*") || (op == "/")) {
      mixin("this.data[] " ~ op ~ "= v.data[];"); 
   }
   
   void opOpAssign(string op, T)(const T v) if(((op == "+") || (op == "-") || (op == "*") || (op == "/")) && isNumeric!T) {
      mixin("this.data[] " ~ op ~ "= v;"); 
   }
   
   void opAssign(const ref Vec3 v) 
   {
      this.data[] = v.data[]; 
   }

   void opAssign(Vec3 v) 
   { 
      this.data[] = v.data[]; 
   }

   @property float magnitude() const
   { 
      import std.math : sqrt;
      return sqrt(x*x + y*y + z*z);
   }
   
   Vec3 normalized() const
   {
      auto m = magnitude();
      if (m == 0) return Vec3();
      else return this / magnitude; 
   }
   
   void normalize() 
   { 
      auto m = magnitude();
      if (m == 0) return;
      else this /= magnitude; 
   }
   
   Vec3 dotProduct   (const ref Vec3 v) const  { return this*v; }
   Vec3 crossProduct (Vec3 v)           const  { return Vec3(y*v.z - z*v.y, z*v.x - x*v.z, x*v.y - y*v.x); }

}