
Animable a, b, c, d;

int times = 0;

void setup(){
  
  size(1600,800);
  frameRate(30);
  
  // Define animation for A
  a = new Animable(100,100, 1, 0, "plane01.svg");
  a.setPosAnimation(30, 910, 520, 0.1);
  a.setSizeAnimation(30, 4, 0.01);
  a.setRotAnimation(120, TWO_PI, 0.1);
  
  // Define animation for B
  b = new Animable(300, 600, 0, 0, "helico01.svg");
  b.setSizeAnimation(30, 3, 0.1);
  b.setPosAnimation(60, 1200, 200, 0.1);
  
  // Define animation for C
  c = new Animable(1400, 400, 1, 0, "balloon01.svg");
  c.setPosAnimation(20, 200, 400, 0.1);
  
  // Define animation for D
  d = new Animable(width/2, height/2, 0, 0, "Hello.svg");
  d.setSizeAnimation(10, 3, 0.01);
  
  
}



void draw(){

  background(255);

  // Animating & drawing A
  a.animate();
  a.display();
  
  // Animating & drawing B
  b.animate();
  b.display();
  
  // Animating & drawing C
  c.animate();
  c.display();

  // Animating & drawing D
  d.animate();
  d.display();
  
  // Repeat animation every 80 frames but only 5 times
  if(frameCount%80==0  && times <5){
    if(times%2==0){
      c.setPosAnimation(frameCount, 200, 400, 0.1);
    }
    else {
      c.setPosAnimation(frameCount, 1400, 400, 0.1);
    }
    times++;
  }
  
}
