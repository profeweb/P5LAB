
void filesSelected(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
  } else {
    // Obtenim la ruta i el nom del fitxer seleccionat
    rutaFitxers[numFitxers]  = selection.getAbsolutePath();  // Ruta del fitxer
    titolFitxers[numFitxers] = selection.getName();          // Nom títol fitxer
    numFitxers++;
    if(numFitxers==numFitxersMax){
      b1.enabled = false;
    }
  }
}
