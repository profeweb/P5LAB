class Linia {

  // Atributs
  Punt a , b;
  String nom;
  
  //Constructor 1
  Linia(Punt a, Punt b){
    this.nom = a.nom+b.nom;
    this.a = a;
    this.b = b;
  }

  //Constructor 2
  Linia(String n, Punt a, Punt b){
    this.nom = n;
    this.a = a;
    this.b = b;
  }

  // Getters
  
  String getNom(){
    return this.nom;
  }

  Punt getPuntA(){
    return this.a;
  }

  Punt getPuntB(){
    return this.b;
  }

  // Setters
  
  void setNom(String n){
    this.nom = n;
  }

  void setPuntA(Punt p){
    this.a = p;
  }
 
  void setPuntB(Punt p){
    this.b = p;
  }


  // Altres mètodes

  void print(){
    System.out.println("Línia: "+this.nom);
    this.a.print();
    this.b.print();
  }
  
  void display(){
    
    // Dibuixa punts de la línia
    a.display();
    b.display();
    
    // Dibuixa la línia entre els punst a i b
    stroke(255,0,0); strokeWeight(3);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
    // Dibuixa el text de la línia
    text(this.nom, (a.x+ b.x)/2.0, (a.y+b.y)/2.0, (a.z+b.z)/2.0 + 20);
  }
  
  
}
