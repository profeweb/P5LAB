
void fileSelected(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
  } else {
    
    // Obtenim la ruta del fitxer seleccionat
    rutaImatge = selection.getAbsolutePath();
    println("Ruta Imatge:"+rutaImatge);
    
    img = loadImage(rutaImatge);  // Actualitzam imatge    
    titol = selection.getName();  // Actualitzam títol
    println("Nom Imatge:"+titol);
  }
}
