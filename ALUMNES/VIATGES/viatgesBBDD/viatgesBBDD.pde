void setup(){
  size(800,800);
  
  // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("continente");
  println("\nFiles Continente:"+n);
  
  // Dades d'una taula
  String[][] dades1 = getInfoTaulaContinente();
  println("\nDades Taula Continente:");
  printArray2D(dades1);
  
  // Num Files (Paisos d'Europa)
  int np = getNumRowsPaisosContinente(2);
  println("\nNum Paisos d'Europa:"+np);
  
  // Paisos de Europa
  String[][] dades2 = getInfoTaulaPaisos(2);
  println("\nDades Taula Pais (2 - Europa):");
  printArray2D(dades2);
  
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] nomsC = getColumn("nombre", "continente");
  println("\nNoms Continents:");
  printArray(nomsC);
  
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] nomsP = getColumn("nombre", "pais");
  println("\nNoms Paisos:");
  printArray(nomsP);
  
  // Insereix un nou Lugar
  //insertLugar("Museo Reina Sofia", "Museo de Arte Contemporaneo...", "Madrid");
  //insertLugar("Nombre", "Descripción", "Madrid");
  
  // Modifica un Lugar
  //int idl = getIdLugar("Paseo del Prado");
  //println("\nId del Paseo del Prado:"+idl);
  //updateLugar(idl,"Paseo del Prado","Paseo Precioso...","Madrid");
  
  // Elimina un Lugar
  //int idl2 = getIdLugar("Nombre");
  //deleteLugar(idl2);
  
  // Noms dels continents
  String[] nomsCs = getContinents();
  println("\nNoms Continents:");
  printArray(nomsCs);
  
  // Noms dels paisos d'un continent
  String[] nomsPC = getPaisesContinente("Europa");
  println("\nNoms Paisos Continent:");
  printArray(nomsPC);
  
  // Noms de les ciutats d'un pais
  String[] nomsCP = getCiutatsPais("España");
  println("\nNoms Ciutats Pais:");
  printArray(nomsCP);
  
  // Noms dels lugares d'una ciutat
  String[] nomsLC = getLugaresCiudad("Madrid");
  println("\nNoms Lugares Ciudad:");
  printArray(nomsLC);
  
  // Noms dels tipos de rutes
  String[] nomsTR= getTiposRutas();
  println("\nNoms Tipus Rutes:");
  printArray(nomsTR);
  
  // Fotos de un lugar
  String[] nomsFL= getFotosLugar(1);
  println("\nNoms Fotos Lugar:");
  printArray(nomsFL);
  
  // Fotos de una ciudad
  String[] nomsFC= getFotosCiudad("Madrid");
  println("\nNoms Fotos Ciudad:");
  printArray(nomsFC);
  
  // Login d'usuari OK
  boolean l1 = login("admin", "12345");
  println("Usuario logeado: "+l1);
  
  // Login d'usuari NO OK (password)
  boolean l2 = login("admin", "abcdefgh");
  println("Usuario logeado: "+l2);
  
  // Nombres de usuarios
  String[] nomsU= getUsuarios();
  println("\nNoms Usuaris:");
  printArray(nomsU);
  
  // Rutas Filtros
  String tipoRuta ="Cultural";
  String fecha1 = "2022-05-10";
  String fecha2 = "2022-05-20";
  String ciudad = "Madrid";
  
  String[][] rF = filtraRutas(tipoRuta, fecha1, fecha2, ciudad);
  println("\n Ruta FIltros:");
  printArray2D(rF);
  
  // Lugares de una Ruta ID
  String[][] lR = lugaresRuta(1);
  println("\n Lugares Ruta:");
  printArray2D(lR);
}

void draw(){
}
