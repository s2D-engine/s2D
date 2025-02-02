package s2d.ui.elements.shapes;

import kha.Canvas;
// s2d
import s2d.ui.effects.Border;
import s2d.ui.graphics.Drawers;

class Rectangle extends UIElement {
	public var border:Border = {};
	public var radius:Float;
	@:isVar public var softness(default, set):Float;

	public function new(?radius:Float = 0.0, ?softness:Float = 1.0, ?scene:UIScene) {
		super(scene);
		this.radius = radius;
		this.softness = softness;
	}

	override function draw(target:Canvas) @:privateAccess {
		Drawers.rectDrawer.render(target, this);
	}

	function set_softness(value:Float):Float {
		softness = Math.max(value, 0.0);
		return value;
	}
}
