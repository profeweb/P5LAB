void setup(){

  String s1 = "Holaquetal";
  boolean b1 = capicua(s1);
  println(s1 +" és capicua? "+b1);  
  
  String s2 = "dabalearrozalazorraelabad";
  boolean b2 = capicua(s2);
  println(s2 +" és capicua? "+b2);  
}

boolean capicua(String s){
  if(s.length()==1){
    return true;
  }
  else if(s.length()==2){
    return s.charAt(0)==s.charAt(1);
  }
  else {
    char cFirst = s.charAt(0);
    char cLast  = s.charAt(s.length()-1);
    String s2 = s.substring(1, s.length()-1);
    return capicua(s2) && (cFirst==cLast);
  }
}
