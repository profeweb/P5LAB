void setup(){

  String s1 = "Holaquetal";
  int nvs1 = comptaConsonants(s1);
  println(s1 +" té "+nvs1+" consonants.");  
}

int comptaConsonants(String s){
  if(s.length()==1){
    char c = s.charAt(0);
    return esConsonant(c);
  }
  else {
    String s1 = s.substring(0, 1);
    String s2 = s.substring(1, s.length());
    return comptaConsonants(s2) + comptaConsonants(s1);
  }
}

int esConsonant(char c){
  if(c=='a' || c=='e' || c=='i' || c=='o' || c=='u'){
    return 0;
  }
  else {
    return 1;
  }
}
