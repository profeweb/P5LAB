
// Número octal a convertir
String numHexa = "FF";

// Número decimal a calcular
int numDecimal;


void setup(){
  
  size(800,800);
   
  // Cridam a la funció que converteix un octal a decimal
  numDecimal = calculateDecimal(numHexa);
  
}

void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Hexadecimal: "+numHexa, 100, height/3);
  
  fill(0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, 2*height/3);
  
  noLoop();
  
}


int calculateDecimal(String numH){
  
  String nH = numH;
  
  int nd = 0;
  int pot = 1;
  
  int index  = nH.length()-1;
  
  do {
    
    
    char digit = nH.charAt(index);
    
    int n=0;
    switch(digit){
      case 'A': n = 10; break;
      case 'B': n = 11; break;
      case 'C': n = 12; break;
      case 'D': n = 13; break;
      case 'E': n = 14; break;
      case 'F': n = 15; break;
      default:  n = Character.getNumericValue(digit);
    }
    
    nd +=  n*pot;
    
    pot = pot * 16;
    
    index --;
    
  } while(index>=0);
  
  return nd;
}
