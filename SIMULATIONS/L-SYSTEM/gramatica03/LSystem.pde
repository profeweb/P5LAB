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
      int rand = (int)random(indexos.size());
      return rules.get(rand).successor;
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
}
