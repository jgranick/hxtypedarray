package typedarray;

import typedarray.ArrayBufferView;
import typedarray.TypedArrayType;

@:forward()
@:arrayAccess
abstract Float32Array(ArrayBufferView) from ArrayBufferView to ArrayBufferView {

    public inline static var BYTES_PER_ELEMENT : Int = 4;

    public var length (get, never):Int;

    public inline function new( elements:Int )
        this = new ArrayBufferView( elements, Float32 );

    public static inline function fromArray( array:Array<Float> ) : Float32Array
        return new Float32Array(0).initArray( array );

    public static inline function fromBuffer( buffer:ArrayBuffer, ? byteOffset:Int = 0, count:Null<Int> = null ) : Float32Array
        return new Float32Array(0).initBuffer( buffer, byteOffset, count );

    public static inline function fromTypedArray( view:ArrayBufferView ) : Float32Array
        return new Float32Array(0).initTypedArray( view );

//Public API

        //still busy with this
    public inline function subarray( begin:Int, end:Null<Int> = null) : Float32Array return this.subarray(begin, end);

//Internal

    inline function get_length() return this.length;


    @:noCompletion
    @:arrayAccess
    public inline function __get(idx:Int) : Float {
        #if js
        untyped return (untyped this.buffer.b)[(this.byteOffset/BYTES_PER_ELEMENT)+idx];
        #else
        return ArrayBufferIO.getFloat32(this.buffer, this.byteOffset+(idx*BYTES_PER_ELEMENT) );
        #end
    }

    @:noCompletion
    @:arrayAccess
    public inline function __set(idx:Int, val:Float) : Float {
        #if js
        untyped return (untyped this.buffer.b)[(this.byteOffset/BYTES_PER_ELEMENT)+idx] = val;
        #else
        return ArrayBufferIO.setFloat32(this.buffer, this.byteOffset+(idx*BYTES_PER_ELEMENT), val);
        #end
    }

}