AudioKeyBoard[] t;

RoundButton b;
RectButton b2;

void setup() {
  size(800, 800);
  t = new AudioKeyBoard[7];
  t[0] = new AudioKeyBoard(4, 100, height/2, width-200, this);
  t[1] = new AudioKeyBoard(3, 100, height/4, width/4, this);
  t[2] = new AudioKeyBoard(1, width-200, 3*height/4, 100, this);
  
  b = new RoundButton(400, 100, 200, 200, color(0, 255, 100), "HOLA");
  b2 = new RectButton(600, 300, 100, 100, color(100, 255, 100), 1);
}

void draw() {
  background(255);
  for (int i=0; i<t.length; i++) {
    if (t[i]!=null) {
      t[i].display();
    }
  }
  
  b.display();
  b2.display();
}

void mousePressed() {
  for (int i=0; i<t.length; i++) {
    if (t[i]!=null) {
      t[i].playSounds();
    }
  }
}
