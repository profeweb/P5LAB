Habitacio h1, h2;
Sensor llum1, llum2, ac1;

void setup(){
  size(1400, 800);
  
  llum1 = new Sensor("Llum");
  llum1.ences = true;
  
  llum2 = new Sensor("llum");
  ac1 = new Sensor("Aire Condicionat");
  
  h1 = new Habitacio("Quarto 1", 0, 0, 300, 300, color(200, 100, 100, 10));
  h1.addSensor(llum1);
  h1.addSensor(ac1);
  
  h2 = new Habitacio("Quarto 2", 300, 0, 400, 600, color(100, 200, 100, 10));
  h2.addSensor(llum2);
}


void draw(){
  
  h1.dibuixa();
  h2.dibuixa();
}
