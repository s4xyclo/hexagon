void setup()
{
  size(600,600);
  background(0);
}

float speed = 0.4;
int rad = 40;

float offset = 15;

int maxHex = 30;

boolean looping = true;

// Recording
boolean recording = false;
int frames = 2000;
String folderName = "C:/Users/Box/Desktop/hexa1/";
//

void draw()
{
  fill(0,120);
  rect(0,0,width,height);
  fill(0);
  stroke(255);
  
  translate(width/2,height/2);
  
  float wave = sin(frameCount/40.0 * speed);
  
  pushMatrix();
  
  hexagon(rad*0.74,wave*TWO_PI);
  
  for(int j = 0; j < 6; j++)
  {
    pushMatrix();
    
    for(int h = 0; h < maxHex; h++)
    {
      int newRad = int(rad/float(h+2));
      
      rotate(PI/6.0*wave);
      
      translate(newRad*2.39 + sin(frameCount/60.0)*offset,0);
      
      //translate(newRad*2.39,0);
      
      hexagon(newRad,wave*TWO_PI);
      
    }
    
    popMatrix();
    
    rotate(-PI/3.0);
  }
  
  popMatrix();
  
  // recording
  if(recording && (frameCount < frames))
    saveFrame(folderName + "/####.png");
}

void hexagon(float r, float theta)
{
  pushMatrix();
  
  rotate(theta);
  translate(r,0);
  rotate(-PI/3.0);
  
  for(int i = 0; i < 6; i++)
  {
    rotate(-PI/3.0);
    line(0,0,r,0);
    translate(r,0);
  }
  
  popMatrix();
}

void keyPressed()
{
  if(key=='z' && looping)
  {
    noLoop(); //<>//
    looping = false;
  }
  else if(key=='z' && !looping)
  {
    loop();
    looping = true;
  }
}