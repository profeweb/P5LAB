
void fileSelected(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
  } else {
    // Obtenim la ruta i el nom del fitxer seleccionat
    rutaFitxer  = selection.getAbsolutePath();  // Ruta del fitxer
    titolFitxer = selection.getName();          // Nom títol fitxer
  }
}
