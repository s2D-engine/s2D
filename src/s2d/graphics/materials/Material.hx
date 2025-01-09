package s2d.graphics.materials;

import kha.Image;
import kha.FastFloat;
import kha.arrays.Float32Array;
// s2d
import s2d.tiling.TileSheet;

class Material {
	public var sheetRows:Int = 1;
	public var sheetColumns:Int = 1;
	public var colorMap:Image;
	public var normalMap:Image;
	public var ormMap:Image;
	public var glowMap:Image;

	public var params:Float32Array;
	public var depthScale(get, set):FastFloat;
	public var glowStrength(get, set):FastFloat;
	public var tilesheet:TileSheet = new TileSheet(1, 1);

	public inline function new() {
		params = new Float32Array(2);
		depthScale = 1.0;
		glowStrength = 1.0;
	}

	inline function get_depthScale():FastFloat {
		return params[0];
	}

	inline function set_depthScale(value:FastFloat):FastFloat {
		params[0] = value;
		return value;
	}

	inline function get_glowStrength():FastFloat {
		return params[1];
	}

	inline function set_glowStrength(value:FastFloat):FastFloat {
		params[1] = value;
		return value;
	}
}
