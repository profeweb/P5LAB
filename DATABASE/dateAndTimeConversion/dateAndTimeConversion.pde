String fechaHora = "2021-03-16 18:33:05";

void setup(){
  String fecha2 = formataTimeStamp(fechaHora);
  println(fecha2);
}

String formataTimeStamp(String tsEntrada){
  
  String parteFecha = tsEntrada.split(" ")[0];
  String parteHora  = tsEntrada.split(" ")[1];
  
  String ano = parteFecha.split("-")[0];
  String mes = parteFecha.split("-")[1];
  String dia = parteFecha.split("-")[2];
  
  String hora    = parteHora.split(":")[0];
  String minutos = parteHora.split(":")[1];
  
  return dia+"/"+mes+"/"+ano+" "+hora+":"+minutos;
}
