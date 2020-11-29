void setup(){

  String s1 = "Holaquetal";
  int nvs1 = comptaVocals(s1);
  println(s1 +" té "+nvs1+" vocals.");  
}

int comptaVocals(String s){
  if(s.length()==1){
    char c = s.charAt(0);
    return esVocal(c);
  }
  else {
    String s1 = s.substring(0, 1);
    String s2 = s.substring(1, s.length());
    return comptaVocals(s2) + comptaVocals(s1);
  }
}


int comptaVocalsIterativa(String s){
  int n =  0;
  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    n = n + esVocal(c);
  }
  return n;
}

int esVocal(char c){
  if(c=='a' || c=='e' || c=='i' || c=='o' || c=='u'){
    return 1;
  }
  else {
    return 0;
  }
}
