
// Número octal a convertir
int numOctal = 113;

// Número decimal a calcular
int numDecimal;


void setup(){
  
  size(800,800);
   
  // Cridam a la funció que converteix un octal a decimal
  numDecimal = calculateDecimal(numOctal);
  
}

void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Octal: "+numOctal, 100, height/3);
  
  fill(0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, 2*height/3);
  
  noLoop();
  
}


int calculateDecimal(int numO){
  
  int n = numO;
  int nd = 0;
  int pot2 = 1;
  
  do {
    
    int resta = n % 10;
    
    n = n / 10;
    
    nd +=  resta*pot2;
    
    pot2 = pot2 * 8;
    
  } while(n!=0);
  
  return nd;
}
