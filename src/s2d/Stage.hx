package s2d;

import kha.Image;
import kha.arrays.Float32Array;
// s2d
import s2d.math.Mat3;
import s2d.objects.Light;
import s2d.objects.Sprite;
import s2d.objects.Object;

@:access(s2d.objects.Object)
class Stage {
	public var sprites:Array<Sprite> = [];
	public var lights:Array<Light> = [];
	public var camera:Object = new Object();

	static final maxLights:Int = 16;
	static final lightStructSize:Int = 8;

	#if S2D_RP_ENV_LIGHTING
	@:isVar public var environmentMap(default, set):Image;

	inline function set_environmentMap(value:Image):Image {
		environmentMap = value;
		environmentMap.generateMipmaps(4);
		return value;
	}
	#end

	public inline function new() {
		lightsData = new Float32Array(1 * maxLights * lightStructSize);
	}

	public var VP(get, null):Mat3;

	inline function get_VP() {
		return S2D.projection * camera._model;
	}

	@:isVar var lightsData(get, null):Float32Array;

	inline function get_lightsData():Float32Array {
		lightsData[0] = lights.length;

		for (i in 0...lights.length) {
			var ind = 1 + i * lightStructSize;
			var light = lights[i];

			lightsData[ind + 0] = light.x;
			lightsData[ind + 1] = light.y;
			lightsData[ind + 2] = light.z;
			lightsData[ind + 3] = light.color.R;
			lightsData[ind + 4] = light.color.G;
			lightsData[ind + 5] = light.color.B;
			lightsData[ind + 6] = light.power;
			lightsData[ind + 7] = light.radius;
		}
		return lightsData;
	}
}
