String[] clients1 = {"Roger", "John", "Nikos", "Marion"};
String[] clients2 = {"Nora", "Bill", "Eliza", "Alex"};

Cua caixa1, caixa2;

void setup() {

  caixa1 = new Cua();
  caixa2 = new Cua();
  
  for(int i=0; i<=3; i++){
    caixa1.encola(clients1[i]);
    caixa2.encola(clients2[i]);
  }
  
  // Despatxam la caixa 1
  int temps1 = 0;
  while(!caixa1.isEmpty()){
    String client = caixa1.desencola();
    int temp = (int) random(1, 100);
    temps1 += temp;
    println(client+" desptatxat en "+temp+" segons.");
  }
  
  // Despatxam la caixa 2
  int temps2 = 0;
  while(!caixa2.isEmpty()){
    String client = caixa2.desencola();
    int temp = (int) random(1, 100);
    temps2 += temp;
    println(client+" desptatxat en "+temp+" segons.");
  }
  
  // Quina caixa és més ràpida
  if(temps1 > temps2){
    println("La caixa 1 és més lenta");
  }
  else {
    println("La caixa 2 és més lenta");
  }

}
