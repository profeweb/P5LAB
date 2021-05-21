Persona[] gent ;

Persona p1;
Alumne a1;
Professor t1;

void setup(){
  size(1600,800);
  p1 = new Persona("Paco", 33, Sexe.HOME, "man.png");
  a1 = new Alumne("Maria", 25, Sexe.DONA, "user-6.png", 1, 'B');
  t1 = new Professor("Pere", 64, Sexe.HOME, "user-4.png", 35, "Física");
  
  gent = new Persona[3];
  gent[0] = p1;
  gent[1] = a1;
  gent[2] = t1;
  
}

void draw(){
  background(255);
  for(int i=0; i<gent.length; i++){
    gent[i].display((i+1)*width/5, height/2);
  }
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
