#version 450

uniform sampler2D normalMap;
uniform sampler2D textureMap;
uniform mat4 invVP;
uniform vec3 cameraPos;
uniform vec2 mistScale;
uniform vec4 mistColor;

in vec2 fragCoord;
out vec4 fragColor;

void main() {
    vec3 normal = texture(normalMap, fragCoord).rgb;
    vec3 position = vec3(fragCoord, normal.z);
    vec4 worldPos = invVP * vec4(position * 2.0 - 1.0, 1.0);
    position = worldPos.xyz / worldPos.w;
    float cameraDist = 1.0 - abs(position.z - cameraPos.z);

    vec3 color = texture(textureMap, fragCoord).rgb;

    // mist
    float mist = smoothstep(0.0, 1.0, mistScale.x + cameraDist * (mistScale.y - mistScale.x));
    color += mistColor.rgb * mistColor.a * mist;

    fragColor = vec4(color, 1.0);
}
