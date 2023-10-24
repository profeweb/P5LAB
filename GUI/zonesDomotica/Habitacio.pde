class Habitacio {
  
  float x, y, w, h;
  String nom;
  color c;
  
  Sensor[] sensors;
  int numSensors =  0;
  
  Habitacio(String n, float x, float y, float w, float h, color c){
    this.nom = n;
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    this.c = c;
    this.sensors = new Sensor[10];
  }
  
  void dibuixa(){
    fill(this.c);
    rect(this.x, this.y, this.w, this.h);
    fill(0); textAlign(CENTER);
    text(this.nom, this.x + this.w/2, this.y + this.h/2);
    
    float ws = this.w / (numSensors + 1);
    for(int i=0; i<numSensors; i++){
      sensors[i].dibuixa(this.x + ws*(i+1), this.y + this.h/8);
    }
  }
  
  void addSensor(Sensor s){
    if(numSensors<sensors.length){
      sensors[numSensors] = s;
      numSensors++;
    }
  }
  
}
