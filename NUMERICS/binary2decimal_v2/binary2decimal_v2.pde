
// Número binari a convertir
int numBinary = 10100101;

// Número decimal a calcular
int numDecimal;


void setup(){
  
  size(800,800);
   
  // Cridam a la funció que converteix un decimal a binari
  numDecimal = calculateDecimal(numBinary);
  
}

void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Binari: "+numBinary, 100, height/3);
  
  fill(0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, 2*height/3);
  
  noLoop();
  
}


int calculateDecimal(int numB){
  
  int nb = numB;
  int nd = 0;
  int pot2 = 1;
  
  do {
    
    int resta = nb % 10;
    
    nb = nb / 10;
    
    nd +=  resta*pot2;
    
    pot2 = pot2 * 2;
    
  } while(nb!=0);
  
  return nd;
}
