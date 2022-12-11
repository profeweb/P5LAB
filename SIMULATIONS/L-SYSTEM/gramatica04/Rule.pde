class Rule {
  
  char predecessor;
  String successor;
  float chance;
  
  Rule(char c, String s, float p){
    this.predecessor = c;
    this.successor  = s;
    this.chance = p;
  }
  
  void printRule(){
    println(this.predecessor +"->"+this.successor+ "("+this.chance+")");
  }
}
