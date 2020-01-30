
// Base del sistema numèric
int base = 2;

// Quantes potències volem calcular
int num = 20;

// Array on guardarem les potències
int[] potencies;

void setup(){
  
  size(800,800);
  
  // Cridam a la funció que calcula i emmagatzema les potències
  calculatePowers(num, base);
  
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
  
  // Imprimeix el contingut de l'array en la cónsola.
  printArray(potencies);
}


void draw(){
  
  background(255);
  
  calculatePowers(num, base);
  
  fill(255,0,0); textSize(48);
  text("Potències de "+base+" : ", 100, 50);
  
  // Mostra les potències
  for(int i=0; i< potencies.length; i++){
    fill(0); textSize(32);
    text (base+" ^ "+ i+ " = " + potencies[i], 100, 100 + i*32);
  }
}

void keyPressed(){
  
  // Incrementa la base
  if(keyCode==UP){
    base++;
  }
  // Decrementa la base
  else if(keyCode==DOWN){
    base--;
  }
}
