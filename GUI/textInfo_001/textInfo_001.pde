TextInfo t1, t2;

void setup(){
  size(800, 800);
  t1 = new TextInfo("Nom de l'usuari", 100, 100, 200, 30);
  t2 = new TextInfo("Número de soci", 100, 200, 200, 30);
}


void draw(){
  background(255);
  t1.display();
  t2.display();
}
