let project = new Project("sEngine");

project.addAssets("assets/**", {
    nameBaseDir: "assets",
    destination: "assets/{dir}/{name}",
    name: "{name}",
});
project.addSources("src");

// Available Engine Compiler Flags
// SENGINE_DEBUG_FPS -> enables FPS debugging

// Available Renderer Compiler Flags:
// S2D_RP_ENV_LIGHTING -> enables environment lighting
// S2D_PP -> enables Post-Processing
// S2D_PP_DOF -> enables Depth of Field PP effect
// S2D_PP_DOF_QUALITY_LEVEL -> sets the quality level of DOF effect (0 - low, 1 - middle, 2 - high)
// S2D_PP_MIST -> enables Mist PP effect
// S2D_PP_FISHEYE -> enables Fisheye PP effect
// S2D_PP_FILTER -> enables 3x3 image convolution multi-pass PP effects
// S2D_PP_COMPOSITOR -> enables compositor / single-pass combination of various (AA, CC etc.) PP effects

resolve(project);
