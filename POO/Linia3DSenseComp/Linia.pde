class Linia {

  // Atributs
  float x1, y1, z1;
  float x2, y2, z2;
  String nom;
  
  //Constructor 1
  Linia(String n, float x1, float y1, float z1, float x2, float y2, float z2){
    this.nom = n;
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.x2 = x2;
    this.y2 = y2;
    this.z2 = z2;
  }

  // Getters
  
  String getNom(){
    return this.nom;
  }

  float getX1(){
    return this.x1;
  }
  
  float getX2(){
    return this.x2;
  }
  
  float getY1(){
    return this.y1;
  }
  
  float getY2(){
    return this.y2;
  }
  
  float getZ1(){
    return this.z1;
  }
  
  float getZ2(){
    return this.z2;
  }

  // Setters
  
  void setNom(String n){
    this.nom = n;
  }

  void setX1(float v){
    this.x1 = v;
  }
  
  void setY1(float v){
    this.y1 = v;
  }
  
  void setZ1(float v){
    this.z1 = v;
  }
  
  void setX2(float v){
    this.x2 = v;
  }
  
  void setY2(float v){
    this.y2 = v;
  }
  
  void setZ2(float v){
    this.z2 = v;
  }
 

  // Altres mètodes

  void print(){
    System.out.println("Línia "+this.nom+" :");
    System.out.println("\t"+this.x1+", "+this.y1+", "+this.z1);
    System.out.println("\t"+this.x2+", "+this.y2+", "+this.z2);
  }
  
  void display(){
    
    // Dibuixa un punt
    pushMatrix();
      translate(x1, y1, z1);
      fill(0);
      ellipse(0,0, 10, 10);
    popMatrix();
    
    // Dibuixa l'altre punt
    pushMatrix();
      translate(x2, y2, z2);
      fill(0);
      ellipse(0,0, 10, 10);
    popMatrix();
    
    // Dibuixa la línia entre els punst
    stroke(255,0,0); strokeWeight(3);
    line(x1, y1, z1, x2, y2, z2);
    // Dibuixa el text de la línia
    text(this.nom, (x1+ x2)/2.0, (y1+y2)/2.0, (z1+z2)/2.0 + 20);
  }
  
  
}
