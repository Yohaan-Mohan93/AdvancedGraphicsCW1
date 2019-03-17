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

//Written by me
void main (void) {
    int counter = 0;
    vec3 st = random(gl_FragCoord.xy);
    
    if(counter == 0){
        st *= tan(u_time);
        counter++;
    }
    else if (counter == 1){
        st *= sin(u_time);
        counter++;
    }
    else if(counter == 2){
        st *= cos(u_time);
        counter = 0;
    }
    
    gl_FragColor = vec4(st.x,st.y,st.z,1.0);
}
