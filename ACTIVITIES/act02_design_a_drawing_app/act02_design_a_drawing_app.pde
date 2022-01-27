// Variables de l'App de Dibuix
color c;
String s;
float r;
boolean enableDrawing;

void setup() {

  size(800, 800);
  background(220);
  rectMode(CENTER);
  ellipseMode(CENTER);

  // Valors inicials de les variables
  c = color(255);
  s = "RECT";
  r = 20;
  enableDrawing = false;
}

// Funció per establir el color de la figura
void setColor() {
  if (key == 'R' || key == 'r') {
    c = color(255, 0, 0);
  } else if (key == 'B' || key == 'b') {
    c = color(0, 0, 255);
  } else if (key == 'G' || key == 'g') {
    c = color(0, 255, 0);
  }
  fill(c);
  println("COLOR: " + red(c)+"-"+green(c)+"-"+blue(c));
}

// Funció per establir la mida de la figura
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

// Funció per establir la forma de la figura
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

// Funció per abilitar / desabilitar el dibuixar
void setEnableDrawing() {
  if (key=='d' || key=='D') {
    enableDrawing = !enableDrawing;
  }
  println("ENABLE DRAWING:"+enableDrawing);
}

// Funció que s'executa en pitjar el teclat
void keyPressed() {
  resetCanvas();
  setEnableDrawing();
  setShape();
  setSize();
  setColor();
}

// Funció que s'executa en pitjar el ratolí
void mousePressed() {
  drawShape();
}

// Funció que dibuixa la figura
void drawShape() {
  if (enableDrawing) {
    fill(c);
    if (s == "RECT") {
      rect(mouseX, mouseY, r, r);
    } else if (s == "CIRCLE") {
      ellipse(mouseX, mouseY, r, r);
    } else if (s == "TRIANGLE") {
      triangle(mouseX, mouseY - r, mouseX - r, mouseY + r, mouseX + r, mouseY + r);
    }
  }
}

// Funció per esborra el dibuix anterior
void resetCanvas() {
  if (keyCode == DELETE) {
    background(220);
  }
}

void draw() {
  drawShape();
}
