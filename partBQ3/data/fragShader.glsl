//Name: Yohaan Mohan
//SRN: 160291137
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 u_resolution ;
uniform vec2 u_mouse;
uniform float u_time;

//Written by me
float WeightedAverage(vec2 _input){
    return mix(_input.x, _input.y, 255.0);
}

//Taken from www.bookofshaders.com
float randomNoise(vec2 p) {
  return fract(6791.*sin(47.*p.x+p.y*9973.));
}

//Written by me
void main (void) {
    vec2 st = vec2(gl_FragCoord.x, gl_FragCoord.y);
    float number = randomNoise(vec2(gl_FragCoord.xy))* fract(WeightedAverage(st));
    float number2 = randomNoise(vec2(gl_FragCoord.xy/u_resolution.xy));
    float number3 = randomNoise(vec2(gl_FragCoord.x/u_resolution.x,WeightedAverage(vec2(gl_FragCoord.xy))));
    
    number += u_mouse.x/u_resolution.x;
    number2 -= u_mouse.y/u_resolution.y;
    number3 += WeightedAverage(u_mouse);
    
    number *= cos(u_time);
    number2 *= sin(u_time);
    number3 *= cos(u_time);    
    
    gl_FragColor = vec4(number,number2,number3,1.0);
}
