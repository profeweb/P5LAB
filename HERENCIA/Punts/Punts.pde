
Punt p1, p2, p3;

void setup(){
  size(800,800);
  
  p1 = new Punt(100,100);
  
  p2 = new Punt(300, 400);
  
  p3 = new Punt(300,200);
}



void draw(){
  
  background(255);
  
  p1.display();
  p2.display();
  p3.display();
   
  
  float d = p1.dist(p2);
  stroke(0);
  line(p1.x, p1.y, p2.x, p2.y);
  
  d = p2.dist(p3);
  stroke(0); 
  line(p2.x, p2.y, p3.x, p3.y);
  
}
