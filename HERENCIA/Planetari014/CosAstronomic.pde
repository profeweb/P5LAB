class CosAstronomic {
  
  // Imatge SVG
  PShape img;

  // Atributs generals
  String nom;
  Tipus tipus;
  String codi;

  //Posició
  float x, y, z;
  float angleOrbita= random(TWO_PI);
  float angleRotacio = 0.0;

  // Propietats físiques
  double masa;
  double volum;
  double densitat;
  double gravetat;
  double radi;

  // Propietats orbitals
  double radiOrbita;
  double periodeOrbita;
  double periodeRotacio;
  double excentricitat;


  // Constructor
  CosAstronomic(String n, Tipus t, String c){
      this.nom = n;
      this.tipus = t;
      this.codi = c;
  }

  //  ************ Setters **************

  void setNom(String n){
    this.nom = n;
  }

  void setTipus(Tipus t){
    this.tipus = t;
  }

  void setCodi(String c){
    this.codi = c;
  }

  void setPosicio(float x, float y, float z){
    this.x = x; this.y = y; this.z = z;
  }

  void setPropsFisiques(double m, double v, double d, double g, double r){
    this.masa = m; 
    this.volum = v; 
    this.densitat = d;
    this.gravetat = g; 
    this.radi = r;
  }

  void setMasa(double m){
    this.masa = m;
  }

  void setVolum(double v){
    this.volum = v;
  }

  void setDensitat(double d){
    this.densitat = d;
  }

  void setGravetat(double g){
    this.gravetat = g;
  }

  void setRadi(double r){
    this.radi = r;
  }

  void setPropsOrbitals(double ro, double po, double pr, double ex){
    this.radiOrbita = ro; 
    this.periodeOrbita = po; 
    this.periodeRotacio = pr;
    this.excentricitat = ex; 
  }

  void setRadiOrbita(double ro){
    this.radiOrbita = ro;
  }

  void setPeriodeOrbita(double po){
    this.periodeOrbita = po;
  }

  void setPeriodeRotacio(double pr){
    this.periodeRotacio = pr;
  }

  void setExcentricitat(double e){
    this.excentricitat = e;
  }
  
  void setImage(String s){
    this.img = loadShape(s);
  }

  //  ************ Getters **************

  String getNom(){
    return this.nom;
  }

  Tipus getTipus(){
    return this.tipus;
  }

  String getCodi(){
    return this.codi;
  }

  double getMasa(){
    return this.masa;
  }

  double getVolum(){
    return this.volum;
  }

  double getDensitat(){
    return this.densitat;
  }

  double getGravetat(){
    return this.gravetat;
  }

  double getRadi(){
    return this.radi;
  }

  double getRadiOrbita(){
    return this.radiOrbita;
  }

  double getPeriodeOrbita(){
    return this.periodeOrbita;
  }

  double getPeriodeRotacio(){
    return this.periodeRotacio;
  }

  double getExcentricitat(){
    return this.excentricitat;
  }


  // Altres
  
  void orbita(CosAstronomic astrePivot){
    
    float r = map((float)this.radiOrbita, 0, 2, 100, 500);
  
    this.x = astrePivot.x + r*cos(angleOrbita);
    this.y = astrePivot.y + r*sin(angleOrbita);
    
    float angStep = map((float) this.periodeOrbita, 0, 90000, 0.001, 0.0001);
    this.angleOrbita+= angStep;
  }
  
  void orbita(CosAstronomic astrePivot, float pos, boolean viewOrbits){
    
    float r = 150*pos;
  
    this.x = astrePivot.x + r*cos(angleOrbita);
    this.y = astrePivot.y + r*sin(angleOrbita);
    
    float angStep = map((float) this.periodeOrbita, 0, 90000, 0.001, 0.0001);
    this.angleOrbita+= angStep;
    
    if(viewOrbits){
      pushMatrix();
        translate(astrePivot.x, astrePivot.y, -5.0);
        noFill();
        stroke(255);
        ellipse(0, 0, 2*r, 2*r);
      popMatrix();
    }
  }
  
  void rota(){
    float rotStep = map((float) this.periodeRotacio, 0, 4000, 0.001, 0.01);
    this.angleRotacio+= rotStep;
  }

  void print(){
    System.out.println("COS ASTRONÒMIC: ");
    System.out.println("\t Nom: "+this.nom);
    System.out.println("\t Tipus: "+this.tipus);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    System.out.println("\t Símbol: "+simbol);
    System.out.println("\t Posició: ("+this.x+", "+this.y+", "+this.z+")");
    System.out.println("\t Propietats Físiques: ");
    System.out.println("\t\t Masa: "+this.masa);
    System.out.println("\t\t Volum: "+this.volum);
    System.out.println("\t\t Densitat: "+this.densitat);
    System.out.println("\t\t Gravetat: "+this.gravetat);
    System.out.println("\t\t Radi: "+this.radi);
    System.out.println("\t Propietats Orbitals: ");
    System.out.println("\t\t Radi Orbital: "+this.radiOrbita);
    System.out.println("\t\t Periode Orbital: "+this.periodeOrbita);
    System.out.println("\t\t Periode Rotació: "+this.periodeRotacio);
    System.out.println("\t\t Excentricitat: "+this.excentricitat);
    System.out.println("");
  }
  
  void display(){
    
    // Mida en funció del radi
    float s;
    if(this.radi<50000){
      s = map((float)this.radi, 1000, 26000, 50, 100);
    }
    else if(this.radi<72000){
      s = map((float)this.radi, 50000, 72000, 150, 200);
    }
    else {
      s = 100;
    }
    
    pushMatrix();
      translate(this.x, this.y, this.z);
      rotate(this.angleRotacio);
      shapeMode(CENTER);
      shape(this.img, 0, 0, s, s);
    popMatrix();
  }

}
