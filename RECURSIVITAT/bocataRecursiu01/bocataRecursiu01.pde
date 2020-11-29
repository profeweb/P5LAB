void setup(){
  
  String bocata ="Bocatademortadela";
  menjar(bocata);
}

String mossegar(String b){
  return b.substring(0,1);
}

boolean esTragable(String b){
  return b.length()==1;
}

void tragar(String b){
  System.out.printf("%s Nyam!!!\n", b);
}

String llevar(String b, String t){
  return b.replaceFirst(t, "");
}

void menjar(String b){
  if(esTragable(b)){
    tragar(b);
  }
  else {
    String boci = mossegar(b);
    menjar(boci);
    String bocataRestant = llevar(b, boci);
    menjar(bocataRestant);
  }
}
