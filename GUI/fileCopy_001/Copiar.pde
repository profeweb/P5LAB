import java.io.IOException;
import java.nio.file.*;

// Copia un fitxer a una altra ubicació
void copiar(String rutaOriginal, String rutaCopia, String titol){
  Path original = Paths.get(rutaOriginal);
  Path copia    = Paths.get(rutaCopia+"/"+titol);
  try{
      Files.copy(original, copia);
      println("OK: fitxer copiat a la carpeta.");
  } catch (IOException e) {
      println("ERROR: No s'ha pogut copiar el fitxer.");
  }
}
