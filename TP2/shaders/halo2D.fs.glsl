#version 330 core

in vec3 vFragColor;
in vec2 vFragPosition;

out vec3 fFragColor;

void main() {
  float a = f;
  float b = 50.f;
  float dist = distance(vec2(0.f), vFragPosition);
  float attenuation = a*exp(-b*dist*dist);
  fFragColor = vFragColor*attenuation;
};