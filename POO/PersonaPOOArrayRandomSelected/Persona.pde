// SUPERCLASSE

enum Sexe {HOME, DONA, ALTRES};

class Persona {
  
  // Atributs
  String nom;
  int edat;
  Sexe sexe;
  PImage foto;

  // Constructor
  Persona(String n, int e, Sexe s, String f){
    this.nom = n;
    this.edat = e;
    this.sexe = s;
    this.foto = loadImage(f);
  }

  // Getters
  
  String getNom(){
    return this.nom;
  }
  
  int getEdat(){
    return this.edat;
  }
  
  Sexe getSexe(){
    return this.sexe;
  }
  
  PImage getFoto(){
    return this.foto;
  }


  // Setters
  
  void setNom(String n){
    this.nom = n;
  }
  
  void setEdat(int e){
    this.edat = e;
  }
  
  void setSexe(Sexe s){
    this.sexe = s;
  }
  
  void setFoto(String f){
    this.foto = loadImage(f);
  }
  
  // Altres
  String toString(){
    return this.nom+", "+this.edat+", "+this.sexe;
  }
  
  void display(float x, float y){
    noFill();
    circle(x, y, 210);
    imageMode(CENTER);
    image(this.foto, x, y, 200, 200);
    fill(0); textSize(34); textAlign(CENTER);
    text(toString(), x, y + 150);
  }

}
