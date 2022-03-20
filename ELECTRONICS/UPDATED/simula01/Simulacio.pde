import processing.serial.*;

class Simulacio {
  
  // Port de connexió sèrie
  Serial port;
  
  // Constructor
  Simulacio(PApplet p){
    // Connecta amb el port Sèrie
    connectSerial(p);
  }
  
  // Inicialitza la connexió
  void connectSerial(PApplet p) {
    printArray("PORTS:"+ Serial.list());   // Llista de ports sèrie
    //port = new Serial(p, "/dev/ttyACM0", 9600);  // Port sèrie
  }
  
  // Escriu al port Sèrie el caracter c
  void writeToSerial(char c){
    //port.write(c);
    println(c);
  }
  
}
