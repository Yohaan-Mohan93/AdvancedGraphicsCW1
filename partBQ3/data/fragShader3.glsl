//Name: Yohaan Mohan
//SRN: 160291137
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PI 3.14159265358979323846
#define PROCESSING_COLOR_SHADER

uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;

//Written by me
vec3 random (in vec2 st) {
    vec3 stu;
    stu.x = fract(tan(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
    stu.y = fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
    stu.z = fract(cos(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
    return stu;
}

//Taken from www.bookofshaders.com
vec2 random2(vec2 st){
    st = vec2( dot(st,vec2(127.1,311.7)),
              dot(st,vec2(269.5,183.3)) );
    return -1.0 + 2.0*fract(sin(st)*43758.5453123);
}

// Value Noise by Inigo Quilez - iq/2013
// https://www.shadertoy.com/view/lsf3WH
float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    vec2 u = f*f*(3.0-2.0*f);

    return mix( mix( dot( random2(i + vec2(0.0,0.0) ), f - vec2(0.0,0.0) ),
                     dot( random2(i + vec2(1.0,0.0) ), f - vec2(1.0,0.0) ), u.x),
                mix( dot( random2(i + vec2(0.0,1.0) ), f - vec2(0.0,1.0) ),
                     dot( random2(i + vec2(1.0,1.0) ), f - vec2(1.0,1.0) ), u.x), u.y);
}

//Written by me
void main (void) {
    vec3 st = random(gl_FragCoord.xy/u_resolution.xy);
    
    st *= (noise(vec2(st.xy)));
    
    st.xy *= u_mouse.xy;
    
    st *= sin(u_time);
    
    gl_FragColor = vec4(st,1.0);
}
