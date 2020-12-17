String[] bus1 = {"Roger", "John", "Nikos", "Marion", "Hellen"};
String[] bus2 = {"Nora", "Bill", "Eliza", "Takis", "Alex"};

String[] registre = {"Alex", "John", "Elina", "Nikos", "Leo", "Marion", "Hellen", "Nora", "Bill", "Eliza", "Takis", "Roger"};

Cua alumnes;

void setup(){
  
  alumnes = new Cua();
  
  for(int i=0; i<=4; i++){
    alumnes.encola(bus1[i]);
  }
  
  for(int i=0; i<=4; i++){
    alumnes.encola(bus2[i]);
  }
  
  while(!alumnes.isEmpty()){
    
    String alumne = alumnes.desencola();
    
    boolean trobat = false;
    
    for(int i=0; i<=11; i++){
      if(registre[i]==alumne){
        trobat = true;
      }
    }
    
    if(trobat){
      println(alumne +" està present!");
    }
    
  }
  
  
}
