#version 330 core
layout(location = 0) in vec2 position;
layout(location = 1) in vec4 color;
layout(location = 2) in vec2 uv;

uniform mat4 projection;
uniform mat4 modelview;
uniform bool hasUV;
uniform sampler2D sampler;

out vec4 fcolor;

void main() {
    if (hasUV) {
        fcolor = texture(sampler, uv);
    } else {
        fcolor = color;
    }
    gl_Position = projection * modelview * vec4(position.xy, 0.0, 1.0);
}
