package s2d;

import kha.FastFloat;
// s2d
import s2d.math.Mat3;
import s2d.math.SMath;

abstract Camera(Mat3) from Mat3 to Mat3 {
	public var x(get, set):FastFloat;
	public var y(get, set):FastFloat;
	public var rotation(get, set):FastFloat;

	public inline function new() {
		this = Mat3.lookAt(vec2(0.0, 0.0), vec2(0.0, -1.0), vec2(0.0, 1.0));
	}

	inline function get_x():FastFloat {
		return this._02;
	}

	inline function set_x(value:FastFloat):FastFloat {
		this._02 = value;
		return value;
	}

	inline function get_y():FastFloat {
		return this._12;
	}

	inline function set_y(value:FastFloat):FastFloat {
		this._12 = value;
		return value;
	}

	inline function get_rotation():FastFloat {
		return atan2(-this._01, this._00);
	}

	inline function set_rotation(value:FastFloat):FastFloat {
		var dr = value - rotation;
		var cos = cos(dr);
		var sin = sin(dr);

		var old_00 = this._00;
		var old_01 = this._01;
		this._00 = old_00 * cos - old_01 * sin;
		this._01 = old_00 * sin + old_01 * cos;

		var old_10 = this._10;
		var old_11 = this._11;
		this._10 = old_10 * cos - old_11 * sin;
		this._11 = old_10 * sin + old_11 * cos;

		return value;
	}
}