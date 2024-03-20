PFont f;
String[] words = {"HELLOWORLD", "BYEWORLD", "ALOHA"};
color[] colors;

void setup() {
  size(800, 800);
  f = createFont("batman.ttf", 18);
  textFont(f);

  colors = new color[10];
  for (int i=0; i<10; i++) {
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw() {  
  background(255);
  textAlign(LEFT); 
  fill(200, 100, 100);
  textSize(36);
  translate(width/2, height/2);
  for (int i=0; i<8; i++) {
    pushMatrix();
    rotate(i* PI/4 + frameCount/100.0);
    fill(colors[i]);
    textSize( 20 + 30*abs(sin((frameCount + i*10)/10.0)));
    text(words[i%3], 10 + abs(50*sin(frameCount/100.0)), 0);
    popMatrix();
  }

  if (frameCount%100 ==0) {
    for (int i=0; i<10; i++) {
      colors[i] = color(random(255), random(255), random(255));
    }
  }
}
