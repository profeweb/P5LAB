// Conversió de TimeStamp del format EUROPEU al format ENG
// "16/03/2021 18:33:05"  ----->  "2021-03-16 18:33:05" 

String fechayHora = "16/03/2021 18:33:05";
String fecha = "16/03/2021";

void setup(){
  String fecha2 = formataFechayHora2(fechayHora);
  println(fecha2);
  
  String fecha3 = formataFecha2(fecha);
  println(fecha3);
}

String formataFechayHora2(String fechayHoraEntrada){
  
  String parteFecha = fechayHoraEntrada.split(" ")[0];
  String parteHora  = fechayHoraEntrada.split(" ")[1];
  
  String dia = parteFecha.split("/")[0];
  String mes = parteFecha.split("/")[1];
  String ano = parteFecha.split("/")[2];
  
  String hora    = parteHora.split(":")[0];
  String minutos = parteHora.split(":")[1];
  
  return ano+"-"+mes+"-"+dia+" "+hora+":"+minutos;
}

String formataFecha2(String fechaEntrada){
  
  String dia = fechaEntrada.split("/")[0];
  String mes = fechaEntrada.split("/")[1];
  String ano = fechaEntrada.split("/")[2];
  
  return ano+"-"+mes+"-"+dia;
}
