String fecha = "2021-03-16 18:33:05";

void setup(){
  String fecha2 = formataFecha(fecha);
  println(fecha2);
}

String formataFecha(String fechaEntrada){
  
  String parteFecha = fechaEntrada.split(" ")[0];
  String parteHora  = fechaEntrada.split(" ")[1];
  
  String ano = parteFecha.split("-")[0];
  String mes = parteFecha.split("-")[1];
  String dia = parteFecha.split("-")[2];
  
  String hora    = parteHora.split(":")[0];
  String minutos = parteHora.split(":")[1];
  
  return dia+"/"+mes+"/"+ano+" "+hora+":"+minutos;
}
