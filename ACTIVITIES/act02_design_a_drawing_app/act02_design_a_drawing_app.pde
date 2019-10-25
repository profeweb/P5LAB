
color c;
String s;
float r;
boolean enableDrawing;

void setup() {

  size(800, 800);
  background(220);
  rectMode(CENTER);
  ellipseMode(CENTER);

  c = color(255);
  s = "RECT";
  r = 20;
  enableDrawing = false;
}

void setColor() {
  if (key == 'R' || key == 'r') {
    c = color(255, 0, 0);
  } else if (key == 'B' || key == 'b') {
    c = color(0, 0, 255);
  } else if (key == 'G' || key == 'g') {
    c = color(0, 255, 0);
  }
  fill(c);
  println("COLOR: " + c);
}

void setSize() {
  if (keyCode == UP) {
    r+=10;
  } else if (keyCode == DOWN) {
    r-=10;
    if (r <= 5) {
      r = 5;
    }
  }
  println("SIZE: " + r);
}

void setShape() {
  if (key == '1') {
    s = "RECT";
  } else if (key == '2') {
    s = "CIRCLE";
  } else if (key == '3') {
    s = "TRIANGLE";
  }
  println("SHAPE: " + s);
}

void setEnableDrawing(){
  if(key=='d' || key=='D'){
    enableDrawing = !enableDrawing;
  }
  println("ENABLE DRAWING:"+enableDrawing);
}

void keyPressed() {
  resetCanvas();
  setEnableDrawing();
  setShape();
  setSize();
  setColor();
}

void mousePressed(){
  drawShape();
}

void drawShape() {
  if(enableDrawing){
  if (s == "RECT") {
      rect(mouseX, mouseY, r, r);
    } else if (s == "CIRCLE") {
      ellipse(mouseX, mouseY, r, r);
    } else if (s == "TRIANGLE") {
      triangle(mouseX, mouseY - r, mouseX - r, mouseY + r, mouseX + r, mouseY + r);
    }
  }
}

void resetCanvas() {
  if (keyCode == DELETE) {
    background(220);
  }
}

void draw() {
  drawShape();
}
