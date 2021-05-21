// SUBCLASSE

class Alumne extends Persona {
  
  // Atributs
  int curs;
  char grup;
  
  // Constructor
  
  Alumne(String n, int e, Sexe s, String f, int c, char g){
   super(n, e, s, f);
   this.curs = c;
   this.grup = g;
  }
  
  // Getters
  
  int getCurs(){
    return this.curs;
  }
  
  char getGrup(){
    return this.grup;
  }
  
  // Setters
  
  void setCurs(int n){
    this.curs = n;
  }
  
  void setGrup(char c){
    this.grup = c;
  }
  
  // Altres
  
  String toString(){
    return this.nom+", "+this.curs+"-"+this.grup;
  }
  
}
