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
    for(Rule r : rules){
      if(r.predecessor==predecesor){
        return r.successor;
      }
    }
    return String.valueOf(predecesor);
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
}
