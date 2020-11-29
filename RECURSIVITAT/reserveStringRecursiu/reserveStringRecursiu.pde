void setup(){
  String s1 = "Holaquetal";
  String s2 = "dabalearrozalazorraelabad";
  
  String s1r = reverse(s1);
  String s2r = reverse(s2);
  
  println(s1+" girat és "+s1r);
  println(s2+" girat és "+s2r);
  
}

String reverse(String s){
  if(s.length()==1){
    return s;
  }
  else {
    char cFirst = s.charAt(0);
    String s2 = s.substring(1, s.length());
    return reverse(s2) + cFirst;
  }
}
