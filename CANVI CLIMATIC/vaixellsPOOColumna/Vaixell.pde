
class Vaixell {
  
  // Atributs d'un Vaixell
  String vaixell;
  String origen, desti;
  Data entrada, sortida;
  String empresa, bandera;
  int gt;
  
  int numImatge;
  
  // Constructor de Vaixell
  Vaixell(String v, String o, String d, Data e, Data s, String emp, String band, int gt){
    this.vaixell = v;
    this.origen = o;
    this.desti = d;
    this.entrada = e;
    this.sortida = s;
    this.empresa = emp;
    this.bandera = band;
    this.gt = gt;
    // Imatge que li correspon segons el seu GT
    this.numImatge = (int) map(gt, 0, 250000, 0.0, 8.0);
  }
  
  
}
