
String[] names = {"Pere", "Marc", "Ana", "Maria", "Jaume"};
Pila pnames;

void setup(){
  
  pnames = new Pila();
  
  println("Afegir noms a la pila");
  for(int i=0; i<=4; i++){
    pnames.push(names[i]);
    println("Afegit "+names[i]+" a la pila.");
  }
  
  println("Eliminar noms de la pila");
  while(!pnames.isEmpty()){
    String name = pnames.pop();
    println(name+" ha sigut eliminat de la pila.");
  }
  
}
