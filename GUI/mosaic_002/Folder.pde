

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // Si és un directori, llista tots els noms de fitxers
    String names[] = file.list();
    return names;
  } else {
    // Si no és un directori
    return null;
  }
}
