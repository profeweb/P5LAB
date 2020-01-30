
// Número binari a convertir
int numBinary = 100101;

// Número decimal a calcular
int numDecimal;

// Array on guardarem les potències
int[] potencies;



void setup(){
  
  size(800,800);
  
  // Cridam a la funció que calcula i emmagatzema les potències
  calculatePowers(10, 2);
  
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
  int n = 0;
  int divisio = numB, resta;
  int i = 0;
  
  do {
    
    divisio = nb / 10;
    
    resta = nb % 10;
    
    nb = nb / 10;
    
    n +=  resta*potencies[i];
    
    i++;
    
  } while(divisio!=0);
  
  return n;
}




// Calcula les potencies (num) de la base (base).
void calculatePowers(int num, int base){
  
  // Crea l'array potencies
  potencies = new int[num];
  
  // Calcula i guarda les potències
  int p = 1;
  for(int i=0; i<num; i++){
    potencies[i] = p;
    p = p*base;
  }
}
