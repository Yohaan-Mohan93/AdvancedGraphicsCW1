//Name: Yohaan Mohan
//SRN: 160291137
import peasy.*;

//Provided by UOL
float heightMap[][]; 
float spacing = 20.0; // Use this variable to set the spacing between heightMapmap elements
PeasyCam cam;
float startXY;

//Provided by UOL
void setup()
{
  size(640, 480, P3D);  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  heightMap = new float[30][30];
  for(int i = 0; i < heightMap.length - 1 ; i++ )
    for(int j = 1; j < heightMap.length - 1 ; j++)
      heightMap[i][j] = random(1, spacing);
  startXY = (heightMap.length * spacing)/2;    // This is to recentre the heightMapmap
}

void draw()
{
  //Provided by UOL
  background(255);
  
  //Written by Me
  for(int i = 0; i < heightMap.length - 1 ; i++)
  {
     beginShape(QUAD_STRIP);
    for(int j = 0; j < heightMap.length - 1; j++)
    {      
     vertex(spacing * (i + 1)     ,spacing * j         , heightMap[i + 1][j + 1]);
     vertex(spacing * i           ,spacing * j         , heightMap[i    ][j + 1]);
    }
    endShape(CLOSE);
  }
}

//Written by me
void keyPressed(){
 if(key == CODED){
   if(keyCode == UP){
     for(int i = 0; i < 5; i++){
       heightMap[(int)random(0,29)][(int)random(0,29)] = random(spacing, (2 * spacing));
     }
   }
   if(keyCode == DOWN){
     for(int i = 0; i < 5; i++){
       heightMap[(int)random(0,29)][(int)random(0,29)] = random(1, spacing);
     }
 }
}
}
