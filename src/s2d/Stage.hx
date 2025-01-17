package s2d;

#if (S2D_LIGHTING_ENVIRONMENT == 1)
import kha.Image;
#end
import s2d.core.Buffer;
import kha.math.FastMatrix3;

@:access(s2d.objects.Object)
class Stage {
	public var layers:Buffer<Layer> = [];
	public var camera:Camera = new Camera();
	public var viewProjection(get, null):FastMatrix3;

	public inline function new() {}

	inline function get_viewProjection() {
		return S2D.projection.multmat(camera);
	}

	#if (S2D_LIGHTING_ENVIRONMENT == 1)
	@:isVar public var environmentMap(default, set):Image;

	inline function set_environmentMap(value:Image):Image {
		environmentMap = value;
		environmentMap.generateMipmaps(4);
		return value;
	}
	#end
}
