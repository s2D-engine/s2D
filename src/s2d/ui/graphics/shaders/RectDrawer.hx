package score.graphics.shaders;

import kha.Canvas;
import kha.graphics4.VertexData;
import kha.graphics4.VertexStructure;
import kha.graphics4.ConstantLocation;

class RectDrawer extends Shader {
	var resolutionCL:ConstantLocation;
	var rectBoundsCL:ConstantLocation;
	var rectAttribCL:ConstantLocation;
	var rectColorsCL:ConstantLocation;

	override inline function initStructure() {
		structure = new VertexStructure();
		structure.add("vertPos", VertexData.Float32_3X);
		structure.add("vertCoord", VertexData.Float32_2X);
	}

	override inline function getUniforms() {
		resolutionCL = pipeline.getConstantLocation("uResolution");
		rectBoundsCL = pipeline.getConstantLocation("uRectBounds");
		rectAttribCL = pipeline.getConstantLocation("uRectAttrib");
		rectColorsCL = pipeline.getConstantLocation("uRectColors");
	}

	override inline function setUniforms(target:Canvas, ?uniforms:Dynamic) {
		target.g4.setFloat2(resolutionCL, target.width, target.height);
		target.g4.setFloats(rectBoundsCL, uniforms[0]);
		target.g4.setFloats(rectAttribCL, uniforms[1]);
		target.g4.setFloats(rectColorsCL, uniforms[2]);
	}
}
