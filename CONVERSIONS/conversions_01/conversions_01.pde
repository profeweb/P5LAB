void setup(){
  
  //Converteix número sencer a String:
  String ns = String.valueOf(45);
  println("Int convertit a String: "+ ns);
  
  //Converteix número float a String:
  ns = String.valueOf(45.67);
  println("Float convertit a String: "+ ns);
  
  //Converteix String a número sencer:
  int n = Integer.valueOf("45");
  println("String convertit a int: "+ n);
  
  //Converteix String a número float:
  float f = Float.valueOf("45.67");
  println("String convertit a float: "+ f);  
}
