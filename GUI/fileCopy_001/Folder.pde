// Ruta del fitxer
String rutaFitxer ="";

// Nom del fitxer
String titol="";

// Carpeta on copiar els fitxers
String rutaCopia = "C:\\Users\\tonim\\Documents\\CODE\\P5LAB\\GUI\\fileCopy_001\\data\\";

// Obri finestra per seleccionar fitxer
void fileSelected(File selection) {
  if (selection == null) {
    println("No s'ha seleccionat cap fitxer.");
  } else {
    
    // Obtenim la ruta del fitxer seleccionat
    rutaFitxer = selection.getAbsolutePath();
    println("Ruta del Fitxer:"+rutaFitxer);
    
    titol = selection.getName();  
    println("Nom del Fitxer:"+titol);
    
    copiar(rutaFitxer, rutaCopia, titol);
  }
}
