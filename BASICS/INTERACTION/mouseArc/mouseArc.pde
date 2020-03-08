void setup(){
  size(800,800);
  strokeWeight(5);
}

void draw(){
  
  background(255);
  
  float r = dist(width/2, height/2, mouseX, mouseY);
  
  float dx = mouseX - width/2;
  float dy = mouseY - height/2;
  
  float angle1 = atan2(dy, dx);
  float angle2 = atan2(dy, dx);
  float angle = (float) degrees(angle1 - angle2);
  if (angle < 0) angle += 360;
  
  float angleStart = 0;
  float angleEnd = radians(angle);
  
  fill(255,0,0);
  arc(width/2, height/2, 2*r, 2*r, angleStart, angleEnd);
  
  line(width/2, height/2, mouseX, mouseY);
  
  fill(0);
  ellipse(width/2, height/2, 20,20);
  ellipse(mouseX, mouseY, 20, 20);
}

float angleBetween2Lines(PVector a1, PVector a2, PVector b1, PVector b2) {
    float angle1 = atan2(a2.y - a1.y, a1.x - a2.x);
    float angle2 = atan2(b2.y - b1.y, b1.x - b2.x);
    float angle = (float) degrees(angle1 - angle2);
    if (angle < 0) angle += 360;
    return angle;
}
