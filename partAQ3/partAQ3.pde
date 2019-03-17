//Name: Yohaan Mohan
//SRN: 160291137
import peasy.*;

//Provided by UOL
float heightMap[][]; 
float spacing = 20.0; // Use this variable to set the spacing between heightMapmap elements
PeasyCam cam;
float startXY;
//Written by me
PImage img;

//Provided by UOL
void setup()
{
  size(640, 480, P3D);  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  img = loadImage("download.jpg");
  heightMap = new float[img.height][img.width];
  initializeHeightMap();
  readImage();
  startXY = (heightMap.length * spacing)/2;    // This is to recentre the heightMapmap
}

//Provided by UOL
void draw()
{
  background(255);
  
  //Written by Me
  for(int i = 0; i < heightMap.length - 1 ; i++)
  {
     beginShape(QUAD_STRIP);
    for(int j = 0; j < heightMap[i].length - 1; j++)
    {      
     vertex(spacing * (i + 1)     ,spacing * j         , heightMap[i + 1][j + 1]);
     vertex(spacing * i           ,spacing * j         , heightMap[i    ][j + 1]);
    }
    endShape(CLOSE);
  }
}

//Written by me
void initializeHeightMap(){
  for(int i = 0; i < heightMap.length; i++)
      for(int j = 0; j < heightMap[i].length; j++)
        heightMap[i][j] = 0;
}

//Written by me
void readImage(){
  loadPixels();
 for (int y = 0; y < img.height; y++)
  {
    for (int x = 0; x < img.width; x++)
    {
       int loc = x+y*img.width;
       heightMap[x][y] = abs((img.pixels[loc]/50000));
    }
  }
}
