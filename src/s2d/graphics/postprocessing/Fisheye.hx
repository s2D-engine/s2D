package s2d.graphics.postprocessing;

import kha.Canvas;
import kha.Shaders;
import kha.graphics4.TextureUnit;
import kha.graphics4.ConstantLocation;
// s2d
import s2d.math.Vec2;
import s2d.math.SMath;

class Fisheye extends PPEffect {
	var textureMapTU:TextureUnit;
	var resolutionCL:ConstantLocation;
	var positionCL:ConstantLocation;
	var strengthCL:ConstantLocation;

	public var position:Vec2 = vec2(0.5);
	public var strength:Float = 0.0;

	inline function setPipeline() {
		pipeline.vertexShader = Shaders.s2d_2d_vert;
		pipeline.fragmentShader = Shaders.fisheye_pass_frag;
	}

	inline function getUniforms() {
		textureMapTU = pipeline.getTextureUnit("textureMap");
		resolutionCL = pipeline.getConstantLocation("resolution");
		positionCL = pipeline.getConstantLocation("fisheyePosition");
		strengthCL = pipeline.getConstantLocation("fisheyeStrength");
	}

	inline function render(target:Canvas) {
		final g2 = target.g2;
		final g4 = target.g4;

		g2.begin();
		g4.setPipeline(pipeline);
		g4.setIndexBuffer(S2D.indices);
		g4.setVertexBuffer(S2D.vertices);
		g4.setTexture(textureMapTU, Renderer.ppBuffer.src);
		g4.setFloat2(resolutionCL, S2D.width, S2D.height);
		g4.setVector2(positionCL, position);
		g4.setFloat(strengthCL, strength);
		g4.drawIndexedVertices();
		g2.end();
	}
}
