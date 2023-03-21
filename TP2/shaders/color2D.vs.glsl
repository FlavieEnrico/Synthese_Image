#version 330 core

layout(location = 0) in vec2 aVertexPosition;
layout(location = 1) in vec3 aVertexColor;

out vec3 vFragColor;
out vec2 vFragPosition;

mat3 translate(float tx, float ty) {
  return mat3(vec3(1, 0, 0), vec3(0, 1, 0), vec3(tx, ty, 1));
}

mat3 scale(float sx, float sy) {
  return mat3(vec3(sx, 0, 0), vec3(0, sy, 0), vec3(0, 0, 1));
}

mat3 rotate(float a) {
  return mat3(vec3(cos(radians(a)), sin(radians(a)), 0), 
              vec3(-sin(radians(a)), cos(radians(a)), 0), 
              vec3(0, 0, 1));
}

void main() { 
  vFragPosition = aVertexPosition;
  vFragColor = aVertexColor;
  mat3 M = translate(0.5,0.5);
  mat3 M2 = scale(2,0.5);
  mat3 M3 = rotate(45.);
  vec2 transformed = (M3*vec3(aVertexPosition, 1)).xy;
  gl_Position = vec4(transformed, 0, 1);
};