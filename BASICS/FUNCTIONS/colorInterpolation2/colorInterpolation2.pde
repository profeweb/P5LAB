
color c1 = color(255,0,0);
color c2 = color(0,0,255);

int num = 10;

float amt;

void setup(){
  size(800,800);
  background(255);
}


void draw(){
   
  background(255);
  for(int i=0; i<=num; i++){
    amt = i/(float)num;
    color c = lerpColor(c1, c2, amt);
    fill(c);
    rect(width/num*i, 0, width/num, height);
  }
  
}

void mousePressed(){
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
}
