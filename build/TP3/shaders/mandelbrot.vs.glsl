#version 330 core

layout(location = 0) in vec2 aVertexPosition;

out vec3 vFragColor;
out vec2 vFragPosition;

void main() {
  vFragPosition = aVertexPosition;
  vFragColor = vec3(1.f, 0.f, 0.f);
  gl_Position = vec4(aVertexPosition, 0, 1);
};