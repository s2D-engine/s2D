package s2d.graphics;

import kha.Image;
import haxe.ds.Vector;

class RenderBuffer {
	var buffer:Vector<Image>;

	public var depthMap(get, never):Image;

	// ping-pong
	var srcInd:Int = 0;
	var tgtInd:Int = 1;

	public var src(get, never):Image;
	public var tgt(get, never):Image;

	public inline function new(width:Int, heigth:Int) {
		buffer = new Vector(length);
		resize(width, heigth);
	}

	public inline function resize(width:Int, heigth:Int) {
		for (i in 0...length) {
			buffer[i] = Image.createRenderTarget(width, heigth);
		}
	}

	inline function get_src():Image {
		return buffer[srcInd];
	}

	inline function get_tgt():Image {
		return buffer[tgtInd];
	}

	public inline function swap() {
		srcInd = 1 - srcInd;
		tgtInd = 1 - tgtInd;
	}

	inline function get_depthMap():Image {
		return buffer[2];
	}

	#if (S2D_RP_LIGHTING_DEFFERED == 1)
	static final length = 7;

	public var albedoMap(get, never):Image;
	public var normalMap(get, never):Image;
	public var emissionMap(get, never):Image;
	public var ormMap(get, never):Image;

	inline function get_albedoMap():Image {
		return buffer[3];
	}

	inline function get_normalMap():Image {
		return buffer[4];
	}

	inline function get_emissionMap():Image {
		return buffer[5];
	}

	inline function get_ormMap():Image {
		return buffer[6];
	}
	#else
	static final length = 3;
	#end
}