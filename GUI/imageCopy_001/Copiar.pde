void copiar(String rutaOriginal, String rutaCopia, String titol){
  Path original = Paths.get(rutaOriginal);
  Path copia    = Paths.get(rutaCopia+"/"+titol);
  try{
      Files.copy(original, copia);
      println("OK: imatge copiada a la carpeta.");
  } catch (IOException e) {
      println("ERROR: No s'ha pogut copiar la imatge.");
  }
}
