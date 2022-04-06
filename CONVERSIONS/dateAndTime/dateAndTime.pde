import java.util.Calendar;

void setup(){
  Calendar c = Calendar.getInstance();
    
  int any = c.get(Calendar.YEAR);
  int mes = c.get(Calendar.MONTH) + 1;
  int dia = c.get(Calendar.DATE);
  
  println(formata(dia)+"/"+formata(mes)+"/"+any);
  
  int hora = c.get(Calendar.HOUR);
  int minuts = c.get(Calendar.MINUTE);
  
  println(formata(hora)+":"+formata(minuts));
}

String formata(int d){
  String s = String.valueOf(d);
  return d<10 ? "0"+s : s;
} 
