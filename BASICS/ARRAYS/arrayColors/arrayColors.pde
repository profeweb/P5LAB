
int numColors = 3;
color [] colors;

void setup(){
  
  size(800,800);
  colors = new color[3];
  
  for(int i=0; i<colors.length; i++){
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw(){
  
  float x = random(width);
  float y = random(height);
  float s = random(10, 100);
  
  if(frameCount%3==0){
    fill(colors[0]);
    rect(x, y, s, s);
  }
  else if(frameCount%3==1){
    fill(colors[1]);
    ellipse(x, y, s, s);
  }
  else {
    fill(colors[2]);
    triangle(x, y, x-s, y+s, x+s, y+s);
  }
}
