
void fileSelected(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
  } else {
    
    // Obtenim la ruta del fitxer seleccionat
    String rutaImatge = selection.getAbsolutePath();
    
    img = loadImage(rutaImatge);  // Actualitzam imatge    
    titol = selection.getName();  // Actualitzam títol
    // Afegeix la nova imatge a l'array d'imatges
    c.addImage(img);
  }
}
