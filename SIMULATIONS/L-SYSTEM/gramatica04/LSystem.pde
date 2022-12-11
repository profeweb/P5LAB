class LSystem {

  char[] alphabet;
  String axiom;
  ArrayList<Rule> rules;

  int count;
  String current;

  LSystem() {
    count = 0;
    current = "";
    rules = new ArrayList<Rule>();
  }
  
  String getCurrent(){
    return this.current;
  }

  void setAlphabet(char[] a) {
    this.alphabet = a;
  }

  void setAxiom(String a) {
    this.axiom = a;
    this.current = a;
  }

  void addRule(Rule r) {
    rules.add(r);
  }
  
  String getSuccessor(char predecesor){
    ArrayList<Integer> indexos = new ArrayList<Integer>();
    for(int i=0; i<rules.size(); i++){
      Rule r = rules.get(i);
      if(r.predecessor==predecesor){
        indexos.add(i);
      }
    }
    if(indexos.size()==0){
      return String.valueOf(predecesor);
    }
    else {
      float chance = random(0, 1);
      println(chance);
      float acum = 0;
      int i = 0, n=0;
      do {
        n = indexos.get(i);
        acum += rules.get(n).chance;
        i++;
      } while(acum < chance);

      return rules.get(n).successor;
    }
    
  }

  void apply() {
    StringBuffer next = new StringBuffer();
    for (int i = 0; i < current.length(); i++) {
      char c = current.charAt(i);
      String s = getSuccessor(c);
      next.append(s);
    }
    current = next.toString();
    count++;
  }
  
  void printCurrent(){
    println("Generation " + count + ": " + current);
  }
  
  void printAxiom(){
    println("Axiom: "+this.axiom);
  }
  
  void printRules(){
    println("\nRules:");
    for(Rule r : this.rules){
      r.printRule();
    }
  }
  
  void printAlphabet(){
    print("Alphabet: ");
    for(char c : this.alphabet){
      print(c+",");
    }
  }
  
  void printLSystem(){
    printAxiom();
    printAlphabet();
    printRules();
  }
}
