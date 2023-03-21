#version 330 core

//in vec2 vFragPosition;
in vec2 vFragUV;

out vec3 fFragColor;

uniform sampler2D uTexture;

void main() {
    fFragColor=vec3(texture(uTexture, vFragUV));
}