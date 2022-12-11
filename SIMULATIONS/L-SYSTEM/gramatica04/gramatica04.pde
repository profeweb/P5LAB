char[] alphabet = {'A', 'B', 'C', 'D', 'E'};
LSystem ls;
 
void setup() {
  
  // L-System
  ls = new LSystem();
  
  // Alfabet (conjunt de símbols de la gramàtica)
  ls.setAlphabet(alphabet);
  
  // Axioma (simbol iniciador de la gramàtica)
  ls.setAxiom("A");  
  
  // Regles (conjunt de regles de la gramàtica)
  // A -> BC | A | E
  ls.addRule(new Rule('A', "BC", 0.5));   
  ls.addRule(new Rule('A', "A",  0.25));   
  ls.addRule(new Rule('A', "E",  0.25)); 
  
  // B ->DAE | BE | DE
  ls.addRule(new Rule('B', "DAE", 0.5));  
  ls.addRule(new Rule('B', "BE",  0.3)); 
  ls.addRule(new Rule('B', "DE",  0.2));  
  
  // Imprimieix regles
  ls.printLSystem();
  
  // Imprimir generació 0
  ls.printCurrent();
}
 
void draw() {
}
 
void mousePressed() {
  ls.apply();
  ls.printCurrent();
}
