//Name: Yohaan Mohan
//SRN: 160291137
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PI 3.14159265358979323846
#define PROCESSING_COLOR_SHADER

//Taken from www.bookofshaders.com
float random (in float x) { 
    return fract(sin(x)*1e4); 
}

//Taken from www.bookofshaders.com
vec2 rotate2D(vec2 _st, float _angle){
    _st -= 0.5;
    _st =  mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle)) * _st;
    _st += 0.5;
    return _st;
}
//Writen by me
void main()
{
    float x = mod((gl_FragCoord.x)/20.0,2.0);
    float y = mod((gl_FragCoord.y)/20.0,2.0);
    float z = mod(x + y, 2.0);
    
    vec2 st = vec2(x , y);
    st = rotate2D(st,PI*0.25);

    gl_FragColor = vec4(st,z, 1.0);	
}
