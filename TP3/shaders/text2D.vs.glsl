#version 330 core 

layout(location = 0) in vec2 aVertexPosition;
layout(location = 1) in vec2 aVertexUV;

out vec2 vFragPosition;
out vec2 vFragUV;

mat3 rotate(float a) {
  return mat3(vec3(cos(radians(a)), sin(radians(a)), 0), 
              vec3(-sin(radians(a)), cos(radians(a)), 0), 
              vec3(0, 0, 1));
}

uniform mat3 uModelMatrix;
//uniform float uTime;


void main() {
    vFragPosition = aVertexPosition;
    vFragUV=aVertexUV;
    //mat3 M1 = rotate(uTime);
    vec2 transformed=(uModelMatrix*vec3(aVertexPosition,1)).xy;
    gl_Position = vec4(transformed, 0, 1);
}