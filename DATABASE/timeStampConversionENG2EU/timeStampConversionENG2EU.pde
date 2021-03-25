// Conversió de TimeStamp del format ENG al format EUROPEU
// "2021-03-16 18:33:05"  -----> "16/03/2021 18:33:05"

String fechayHora = "2021-03-16 18:33:05";
String fecha = "2021-03-16";

void setup(){
  String fecha2 = formataFechayHora(fechayHora);
  println(fecha2);
  
  String fecha3 = formataFecha(fecha);
  println(fecha3);
}

String formataFechayHora(String fechayHoraEntrada){
  
  String parteFecha = fechayHoraEntrada.split(" ")[0];
  String parteHora  = fechayHoraEntrada.split(" ")[1];
  
  String ano = parteFecha.split("-")[0];
  String mes = parteFecha.split("-")[1];
  String dia = parteFecha.split("-")[2];
  
  String hora    = parteHora.split(":")[0];
  String minutos = parteHora.split(":")[1];
  
  return dia+"/"+mes+"/"+ano+" "+hora+":"+minutos;
}

String formataFecha(String fechaEntrada){
  
  String ano = fechaEntrada.split("-")[0];
  String mes = fechaEntrada.split("-")[1];
  String dia = fechaEntrada.split("-")[2];
  
  return dia+"/"+mes+"/"+ano;
}
