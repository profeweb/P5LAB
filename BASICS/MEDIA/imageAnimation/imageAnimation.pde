PImage img;  // 1
float x, y, ang=0;

void setup(){
  size(800,800);
  img = loadImage("astro.png");  // 2
}

void draw(){
  background(255);
  imageMode(CENTER);
  x = width/2  + 100*cos(ang);
  y = height/2 + 200*sin(ang);
  image(img, x, y);  //3
  ang += 0.01;
  
  saveFrame("animacion/frame#####.png");
  if(ang>= TWO_PI){
    exit();
  }
}
