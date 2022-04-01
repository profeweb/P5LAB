String fechaEng = "2021-03-16";
String fechaEsp = "16/03/2021";

void setup(){
  
  // Formata fecha a format DD/MM/YYYY
  String fecha1 = formataFechaEsp(fechaEng);
  println("Format ESP: "+fecha1);
  
  // Formata fecha a format YYYY-MM-DD
  String fecha2 = formataFechaEng(fechaEsp);
  println("Format ENG: "+fecha2);
}

String formataFechaEsp(String fechaEntrada){
   
  String y = fechaEntrada.split("-")[0];
  String m = fechaEntrada.split("-")[1];
  String d = fechaEntrada.split("-")[2];
  
  return d+"/"+m+"/"+y;
}

String formataFechaEng(String fechaEntrada){
   
  String y = fechaEntrada.split("/")[2];
  String m = fechaEntrada.split("/")[1];
  String d = fechaEntrada.split("/")[0];
  
  return y+"-"+m+"-"+d;
}
