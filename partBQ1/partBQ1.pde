//Name: Yohaan Mohan
//SRN: 160291137
import peasy.*;

PeasyCam cam;
PShape torus;
PShader tileShader;

void setup(){
  size(1024, 720,P3D);
  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  torus = getTorus(150,75,32,32);
  tileShader = loadShader("fragShader.glsl");
}

void draw(){
  background(51);
  shape(torus);
  tileShader.set("u_resolution", (float)width, (float)height);
  shader(tileShader);
}

void keyPressed(){
  if(key == '1'){
   tileShader = loadShader("fragShader.glsl"); 
  }
  if(key == '2'){
    tileShader = loadShader("fragShader2.glsl");
  }
}

// Example of use:     torus = getTorus(200,100,32,32);
PShape getTorus(float outerRad, float innerRad, int numc, int numt) {

  PShape sh = createShape();
  sh.beginShape(TRIANGLE_STRIP);
  sh.noStroke();
  float x, y, z, s, t, u, v;
  float nx, ny, nz;
  float a1, a2;
  int idx = 0;
  for (int i = 0; i < numc; i++) {
    for (int j = 0; j <= numt; j++) {
      for (int k = 1; k >= 0; k--) {
         s = (i + k) % numc + 0.5;
         t = j % numt;
         u = s / numc;
         v = t / numt;
         a1 = s * TWO_PI / numc;
         a2 = t * TWO_PI / numt;
 
         x = (outerRad + innerRad * cos(a1)) * cos(a2);
         y = (outerRad + innerRad * cos(a1)) * sin(a2);
         z = innerRad * sin(a1);
 
         nx = cos(a1) * cos(a2); 
         ny = cos(a1) * sin(a2);
         nz = sin(a1);
         sh.normal(nx, ny, nz);
         sh.vertex(x, y, z);
         
      }
    }
  }
   sh.endShape(); 
  return sh;
}
