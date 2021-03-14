String nomFitxer = "aliments3.csv";

void setup(){
  
  String[] lines = loadStrings(nomFitxer);    // Llegim les línies del fitxer CSV
  
  println("Número d'aliments: " + lines.length);
  
  for (int i = 0 ; i < lines.length; i++) {
    
    //println("\nAliment nº "+i+":");
    
    String[] cols = lines[i].split("\t");
    
    if(cols.length>=9){
      
      String codi    = cols[0];
      String nom     = cols[1];
      String kCal    = cols[2];
      String kJul    = cols[3];
      String protein = cols[4];
      String fat     = cols[5];
      String carbo   = cols[6];
      String fibra   = cols[7];
      String aigua   = cols[8];
      // ...
      
      println("INSERT INTO aliments (id, nom) VALUES('"+codi+"','"+nom+"');");
    }
    
  }
}
