
// Número decimal a convertir
int numDecimal = 123;

// Número hexadecimal a calcular
String numHexa;

void setup(){
  size(800,800);
}



// Retorna el número hexadecimal correponent amb el número decimal numDec
String calculateHexa(int numDec){
  
  int nd = numDec;
  String n = "";
  
  do {
    
    int resta = nd % 16;
    
    nd = nd / 16;
    
    String digit ="";
    switch(resta){
      case 10: digit="A"; break;
      case 11: digit="B"; break;
      case 12: digit="C"; break;
      case 13: digit="D"; break;
      case 14: digit="E"; break;
      case 15: digit="F"; break;
      default: digit = Integer.toString(resta); 
    }
    
    n = digit + n;
    
  } while(nd!=0);
  
  return n;
}


void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, height/3);
  
  // Calcula el número hexadecimal a partir del número decimal
  numHexa = calculateHexa(numDecimal);
  
  fill(0); textSize(48);
  text("Núm. Hexa: "+numHexa, 100, 2*height/3);
  
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
