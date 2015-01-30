package haxe.io.buffer;

#if js

typedef Float32Array = js.html.Float32Array;

#else

import haxe.io.buffer.ArrayBufferView;
import haxe.io.buffer.TypedArrayType;
using haxe.io.buffer.ArrayBufferViewIO;


@:forward()
@:arrayAccess
abstract Float32Array(ArrayBufferView) from ArrayBufferView to ArrayBufferView {

    public var length (get, never):Int;

    public inline function new( elements:Int )
        this = new ArrayBufferView( elements, Float32 );

    public static inline function fromArray( array:Array<Float> )
        return new ArrayBufferView( null, Float32 ).initArray(array);

    public static inline function fromBuffer( buffer:ArrayBuffer, ? byteOffset:Int = 0, count:Null<Int> = null )
        return new ArrayBufferView( null, Float32 ).initBuffer( buffer, byteOffset, count );

    public static inline function fromTypedArray( view:ArrayBufferView )
        return new ArrayBufferView( null, Float32 ).initTypedArray( view );

//Public API

        //still busy with this
    public function subarray( begin:Int, end:Null<Int> = null) : Float32Array return this.subarray(begin, end);

//Internal

    function get_length() return this.length;

    @:noCompletion @:arrayAccess
    public inline function __get(idx:Int) : Float return this.getFloat32(idx);
    @:noCompletion @:arrayAccess
    public inline function __set(idx:Int, val:Float) : Float return this.setFloat32(idx, val);

}

#end