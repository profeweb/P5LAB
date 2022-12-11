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
  ls.addRule(new Rule('A', "BC"));   
  ls.addRule(new Rule('A', "A"));   
  ls.addRule(new Rule('A', "E")); 
  
  // B ->DAE | BE | DE
  ls.addRule(new Rule('B', "DAE"));  
  ls.addRule(new Rule('B', "BE")); 
  ls.addRule(new Rule('B', "DE"));  
  
  // Imprimir generació 0
  ls.printCurrent();
}
 
void draw() {
}
 
void mousePressed() {
  ls.apply();
  ls.printCurrent();
}
