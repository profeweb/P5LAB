
Persona p1;
Alumne a1;
Professor t1;

void setup(){
  size(800,800);
  p1 = new Persona("Paco", 33, Sexe.HOME, "man.png");
  a1 = new Alumne("Maria", 25, Sexe.DONA, "user-6.png", 1, 'B');
  t1 = new Professor("Pere", 64, Sexe.HOME, "user-4.png", 35, "Física");
}

void draw(){
  background(255);
  p1.display(width/4, height/2);
  a1.display(3*width/4, height/2);
  t1.display(width/2, height/2 + 100);
}

void keyPressed(){
  if(keyCode == UP){
    int n = p1.getEdat() + 1;
    p1.setEdat(n);
  }
  else if(keyCode == DOWN){
    int n = p1.getEdat() - 1;
    p1.setEdat(n);
  }
}
