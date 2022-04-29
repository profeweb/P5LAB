Persona[] gent ;
int selected = -1;

String[] noms = {"Paco", "Maria", "Joan", "Bel", "Jose", "Pere" };
String[] deps = {"Física", "Mates", "Llatí", "Plàstica" };

void setup(){
  size(1600,800);
  
  gent = new Persona[4];
  createPeople();
  
}

void draw(){
  background(255); 
  
  for(int i=0; i<gent.length; i++){
    if(i==selected){
      strokeWeight(10);
    }
    else {
      strokeWeight(1);
    }
    
    float x = (i+1)*width/(gent.length+1);
    float y = height/2;
    
    if(gent[i]instanceof Professor){
      y = height/4;
    }
    else if(gent[i] instanceof Alumne){
      y = 3*height/4;
    }
    gent[i].display(x, y);
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

String depRand(){
  int n = (int)random(deps.length);
  return deps[n];
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

void mousePressed(){
  createPeople();
}

void keyPressed(){
  if(key=='0' || key=='1' || key=='2' || key=='3' || key=='4'){
    String s = String.valueOf(key);
    selected = Integer.valueOf(s) - 1;
  }
  else if(keyCode==UP && selected!=-1){
    int e = gent[selected].getEdat()+1;
    gent[selected].setEdat(e);
  }
  else if(keyCode==DOWN && selected!=-1){
    int e = gent[selected].getEdat()-1;
    gent[selected].setEdat(e);
  }
  else if(key=='h' && selected!=-1){
    gent[selected].sexe = Sexe.HOME;
  }
  else if(key=='d' && selected!=-1){
    gent[selected].sexe = Sexe.DONA;
  }
  else if(key=='a' && selected!=-1){
    gent[selected].sexe = Sexe.ALTRES;
  }
  else if(key=='n' && selected!=-1){
    gent[selected].nom = nomRand();
  }
   else if(key=='f' && selected!=-1){
    gent[selected].setFoto(fotoRand());
  }
    
}

void createPeople(){
  for(int i=0; i<gent.length; i++){
    float r = random(1);
    if(r<1/3f){
      gent[i] = new Persona(nomRand(), edatRand(), sexeRand(), fotoRand());
    }
    else if(r>=1/3f && r<2/3f){
      gent[i] = new Alumne(nomRand(), edatRand(), sexeRand(), fotoRand(), 1, lletraRand());
    }
    else {
      gent[i] = new Professor(nomRand(), edatRand(), sexeRand(), fotoRand(), 35, depRand());
    }
  }
}
