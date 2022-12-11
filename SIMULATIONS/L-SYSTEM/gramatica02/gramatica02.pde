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
  ls.addRule(new Rule('A', "BC"));   // A ->BC
  ls.addRule(new Rule('B', "DAE"));  // B ->DAE 
  
  // Imprimir generació 0
  ls.printCurrent();
}
 
void draw() {
}
 
void mousePressed() {
  ls.apply();
  ls.printCurrent();
}
