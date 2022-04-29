class Punt {

  // Atributs
  float x;
  float y;
  String nom;

  // Mètodes (funcions)

  // Constructor
  Punt(String n, float x, float y){
    this.nom = n;
    this.x = x;
    this.y = y;
  }

  // Getters

  String getNom(){
    return this.nom;
  }

  float getX(){
    return this.x;
  }

  float getY(){
    return this.y;
  }

  // Setters

  void setNom(String n){
    this.nom = n;
  }

  void setX(float x){
    this.x = x;
  }
  
  // Altres
  
  void print(){
    println(this.nom+" ("+this.x+", "+this.y+")");
  }
 
  
  void display(color c){
    fill(c); noStroke();
    ellipse(this.x, this.y, 20, 20);
    fill(0); textSize(18); textAlign(CENTER);
    text(this.nom, this.x, this.y - 20);
  }
}
