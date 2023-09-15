void setup() {
  noStroke();
  size(750, 750);  //feel free to change the size
}
int startX = 10;
int endX = 500;
int startY = 10;
int endY = 300;

int vY = 50;
float vX = (endX-startX)/2.0;
float scaleSizeX = 5;
float scaleSizeY = 5;

float centerX = 375;
float centerY = 375;
float ang = 0;


void draw() {
  background(0);
  noStroke();
  ang += 0.2;
  for (int y = startY; y <= endY; y+=2*scaleSizeY){
    float b = 0;
    if (y <= endY/2.0)
       b = 1 - (y/( endY/2.0));
    else if (y > endY/2.0){
      b = -((y - endY/2.0)/(endY/2.0));
    }
   
   
      for(int x = startX; x <= endX; x+=2*scaleSizeX){
        float a = vY/((vX - startX) * (vX - endX));
        float eq = -a * (x-startX) * (x-endX) * b;
       
        float c = 0;
        if (x <= endX/2.0)
          c = (x/( endX/2.0));
        else if (x > endX/2.0){
          c = 1-((x - endX/2.0)/(endX/2.0));
        }
        fill(50 + cos(radians(ang+90))*200+x,50 + cos(radians(ang-90))*200+x,50 + cos(radians(ang))*200-x);
        pushMatrix();
        translate(centerX-(endX/2),centerY-(endY/2));
        scale(x +eq*4*cos(radians(ang)),y + eq*4*sin(radians(ang)),scaleSizeX * c,scaleSizeY*c);
        popMatrix();
       
      }
  }
  //your code here
}
void scale(float x, float y, float sX, float sY) {
 
   beginShape();
   curveVertex(x,y - sY);
   curveVertex(x,y - sY);
   curveVertex(x + sX,y);
   curveVertex(x,y + sY);
   curveVertex(x,y + sY);
   endShape();
   beginShape();
   curveVertex(x,y + sY);
   curveVertex(x,y + sY);
   curveVertex(x - sX,y);
   curveVertex(x,y - sY);
   curveVertex(x,y - sY);
   endShape();
   
}
