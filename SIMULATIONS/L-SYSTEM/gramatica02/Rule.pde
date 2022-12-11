class Rule {
  
  char predecessor;
  String successor;
  
  Rule(char c, String s){
    this.predecessor = c;
    this.successor  = s;
  }
  
  void printRule(){
    println(this.predecessor +"->"+this.successor);
  }
}
