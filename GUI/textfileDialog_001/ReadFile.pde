void readSelectedTextFile(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
    
  } else {
    
    // Obtenim la ruta del fitxer seleccionat
    String rutaFitxer = selection.getAbsolutePath();
    
    String[] lines = loadStrings(rutaFitxer);  // Llegim el text    
    areaText.setLines(lines); // Actualitzam l'area de Text
    titol = selection.getName();  // Actualitzam títol
  }
}
