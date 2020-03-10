class Data {
  
  // Atributs d'una Data
  int dia, mes, any;
  int hora, minuts;
  
  // Constructor de Data 1
  Data(int d, int m, int a, int h, int min){
    this.dia = d;
    this.mes = m;
    this.any = a;
    this.hora = h;
    this.minuts = min;
  }
  
  // Constructor de Data 2
  Data(String s){
    String[] parts = s.split(" ");
    String[] partsData = parts[0].split("/");
    String[] partsHora = parts[1].split(":");
    this.dia = int(partsData[0]);
    this.mes = int(partsData[1]);
    this.any = int(partsData[2]);
    this.hora = int(partsHora[0]);
    this.minuts = int(partsHora[1]);
  }
  
  // Mètode per mostrar informació de data en format String
  String toString(){
    return this.dia+"/"+this.mes+"/"+this.any+" "+this.hora+":"+this.minuts;
  }
  
}
