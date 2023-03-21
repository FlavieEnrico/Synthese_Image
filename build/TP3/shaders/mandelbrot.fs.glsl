#version 330 core

in vec3 vFragColor;
in vec2 vFragPosition;

out vec3 fFragColor;

vec2 complexSqr(vec2 z) {
  return vec2(z.x*z.x-z.y*z.y,2*(z.x*z.y));
}

void main() {
  vec2 c = vec2(vFragPosition.x,vFragPosition.y);
  vec2 z = vec2(vFragPosition.x,vFragPosition.y);

  int n = 50;
  vec3 color;
  for (int i = 0; i < n; ++i){
      z = complexSqr(z) + c;

      if ( length(z) > 2.0){
          color = vec3(float(i)/n);
          break;
      }      
      else{
          color = vec3(1.0f, 1.0f, 1.0f);
      }
  }

  fFragColor = color;
};