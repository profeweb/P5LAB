
import java.lang.Math;

class Punt {

  // Atributs
  float x, y, z;
  String nom;


  // Mètodes (funcions)

  // Constructor
  Punt(String n, float x, float y, float z){
    this.nom = n;
    this.x = x;
    this.y = y;
    this.z = z;
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

  float getZ(){
    return this.z;
  }

  // Setters

  void setNom(String n){
    this.nom = n;
  }

  void setX(float x){
    this.x = x;
  }

  void setY(float y){
    this.y = y;
  }

  void setZ(float z){
    this.z = z;
  }

  // Altres mètodes

  double distance(Punt altre){
    
    double dx = this.x - altre.x;
    double dy = this.y - altre.y;
    double dz = this.z - altre.z;

    return Math.sqrt(dx*dx + dy*dy + dz*dz);
  }


  void print(){
    System.out.println(this.nom+":("+this.x+", "+this.y+", "+this.z+")");
  }
  
  void display(){
    
    fill(255);
    ellipse(this.x, this.y, 10, 10);
    fill(0); textSize(24);
    text(this.nom, this.x+20, this.y);
  }

}
