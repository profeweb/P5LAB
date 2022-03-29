void setup(){
  size(800,800);
  connexioBBDD();
  
  int n = getNumRowsTaula("continente");
  println(n);
}

void draw(){
}
