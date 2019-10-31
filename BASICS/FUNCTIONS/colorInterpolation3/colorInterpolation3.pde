
color c1 = color(255,0,0);
color c2 = color(0,255,0);
color c3 = color(0,0,255);

int num = 20;

float amt;

void setup(){
  size(800,800);
  background(255);
}


void draw(){
   
  background(255);
  for(int i=0; i<=num; i++){
    amt = i/(float)num;
    color cTemp = lerpColor(c1, c2, amt);
    for(int j=0; j<= num; j++){
      amt = j/(float)num;
      color c = lerpColor(cTemp, c3, amt);
      fill(c);
      rect(width/num*i, height/num*j, width/num, height);
    }
  }
  
}

void mousePressed(){
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
}
