// SUBCLASSE

class Professor extends Persona{
  
  // Atributs
  int anys;
  String departament;
  
  // Constructor
  Professor(String n, int e, Sexe s, String f, int a, String d){
    super(n, e, s, f);
    this.anys = a;
    this.departament = d;
  }
  
  // Getters
  int getAnys(){
    return this.anys;
  }
  
  String getDepartament(){
    return this.departament;
  }
  
  // Setters
  
  void setAnys(int n){
    this.anys = n;
  }
  
  void setDepartament(String d){
    this.departament = d;
  }
  
  String toString(){
    return this.nom+", "+this.departament;
  }
  
}
