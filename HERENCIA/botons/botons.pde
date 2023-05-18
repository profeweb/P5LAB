BotoCircular bc;
BotoRectangular br;

color bgColor;

void setup(){
  size(800,800);
  bc = new BotoCircular(400,400, 200, 200, "OK", color(255, 0, 0));
  br = new BotoRectangular(600,200, 200, 100, "YES", color(255, 255, 0));
  bgColor = color(255);
}


void draw(){
  background(bgColor);
  bc.display();
  br.display();
}

void mousePressed(){
  if(bc.mouseOver() || br.mouseOver()){
    bgColor = color(random(255), random(255), random(255));
  }

}
