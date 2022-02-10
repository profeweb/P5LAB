PImage img;  // 1
float x, y, ang;

void setup(){
  size(800,800);
  img = loadImage("astro.png");  // 2
  ang = 0;
}

void draw(){
  background(255);
  imageMode(CENTER);
  x = width/2  + 200*cos(ang);
  y = height/2 + 200*sin(ang);
  image(img, x, y);  //3
  ang += 0.01;
}
