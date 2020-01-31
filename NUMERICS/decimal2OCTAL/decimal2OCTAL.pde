
// Número decimal a convertir
int numDecimal = 123;


// Número octal a calcular
int numOctal;

void setup(){
  
  size(800,800);
  
}



// Retorna el número octal correponent amb el número decimal numDec
int calculateOctal(int numDec){
  
  int nd = numDec;
  int n = 0;
  int pot10 = 1;
  
  do {
    
    int resta = nd % 8;
    
    nd = nd / 8;
    
    n = resta*pot10 + n;
    
    pot10 = pot10 * 10;
    
  } while(nd!=0);
  
  return n;
}


void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, height/3);
  
  // Calcula el número octal a partir del número decimal
  numOctal = calculateOctal(numDecimal);
  
  fill(0); textSize(48);
  text("Núm. Octal: "+numOctal, 100, 2*height/3);
  
}

void keyPressed(){
  
  // Incrementa el número decimal
  if(keyCode==UP){
    numDecimal++;
  }
  // Decrementa el número decimal
  else if(keyCode==DOWN){
    numDecimal--;
  }
}
