class Hole {
  
  int address;
  int mida;
  
  Hole(int a , int m){
    this.address = a;
    this.mida = m;
  }
  
  void display(float x, float y, float h){
     fill(50); stroke(0); strokeWeight(3);
     rect(x + this.address, y, this.mida, h);
  }
  
}
