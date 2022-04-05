void guardarText(String txt, String ruta, String titol){
  PrintWriter output = createWriter(ruta+titol); 
  output.print(txt);
  output.flush();
  output.close();
  println("OK: Text guardat en el fitxer.");
}
