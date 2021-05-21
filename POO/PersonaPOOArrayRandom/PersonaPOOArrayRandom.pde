Persona[] gent ;

String[] noms = {"Paco", "Maria", "Joan", "Bel", "Jose", "Pere" };

void setup(){
  size(1600,800);
  
  gent = new Persona[4];
  
  for(int i=0; i<gent.length; i++){
    float r = random(1);
    if(r<1/3f){
      Persona p = new Persona(nomRand(), edatRand(), sexeRand(), fotoRand());
      gent[i] = p;
    }
    else if(r>=1/3f && r<2/3f){
      Alumne a = new Alumne(nomRand(), edatRand(), sexeRand(), fotoRand(), 1, lletraRand());
      gent[i] = a;
    }
    else {
      Professor t = new Professor(nomRand(), edatRand(), sexeRand(), fotoRand(), 35, "Física");
      gent[i] = t;
    }
  }
  
}

void draw(){
  background(255);
  for(int i=0; i<gent.length; i++){
    if(gent[i]instanceof Professor){
      gent[i].display((i+1)*width/5, height/3);
    }
    else if(gent[i] instanceof Alumne){
      gent[i].display((i+1)*width/5, 2*height/3);
    }
  }
}

String fotoRand(){
  int n = (int)random(1, 24);
  return "user-"+n+".png";
}

String nomRand(){
  int n = (int)random(noms.length);
  return noms[n];
}

int edatRand(){
  int n = (int)random(12, 100);
  return n;
}

Sexe sexeRand(){
  float r = random(1);
  if(r<1/3f){
    return Sexe.HOME;
  }
  else if(r>=1/3f && r<2/3f){
    return Sexe.DONA;
  }
  else {
    return Sexe.ALTRES;
  }
}

char lletraRand(){
  int nr = (int)random(65, 90);
  return (char)nr;
}
