import java.util.Calendar;

class Calendari {
  
  String[] months = {"Jan","Feb","Mar","Apr","May","Jun",
                     "Jul","Aug","Sep","Oct","Nov","Dec"};

  int any, mes, dia;
  int numWeeksMonth, numDaysMonth, numDaysPrevMonth;
  int firstDay;
  
  Calendar cal, cPrev;
  
  Calendari(){
    
    this.cal = Calendar.getInstance();
    this.any = cal.get(Calendar.YEAR);
    this.mes = cal.get(Calendar.MONTH) + 1;
    this.dia = cal.get(Calendar.DATE);
    this.numWeeksMonth = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
    this.numDaysMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    //cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.firstDay = 1; //cal.get(Calendar.DATE);
    
    //cPrev = Calendar.getInstance();
    //cPrev.set(Calendar.MONTH, -2);
    this.numDaysPrevMonth = 0; //cPrev.getActualMaximum(Calendar.DAY_OF_MONTH);
    
  }
  
  void nextMonth(){
    
    cal.roll(Calendar.MONTH, true);
    
    this.any = cal.get(Calendar.YEAR);
    this.mes = cal.get(Calendar.MONTH) + 1;
    this.dia = cal.get(Calendar.DATE);
    
    if(this.mes==0){
      cal.set(Calendar.YEAR, this.any+1);
    }
   
    
    this.numWeeksMonth = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
    this.numDaysMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    //cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.firstDay = 1; 
  }
  
  void prevMonth(){
    
    cal.roll(Calendar.MONTH, false);
    
    this.any = cal.get(Calendar.YEAR);
    this.mes = cal.get(Calendar.MONTH) + 1;
    this.dia = cal.get(Calendar.DATE);
    
    this.numWeeksMonth = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
    this.numDaysMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    //cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.firstDay = 1; //cal.get(Calendar.DATE);
    
    /*cPrev = Calendar.getInstance();
    cPrev.set(Calendar.MONTH, -2);
    this.numDaysPrevMonth = cPrev.getActualMaximum(Calendar.DAY_OF_MONTH);
    */
  }
  
  void displayDay(float x, float y, float w, float h, int nd, boolean enabled){
    if(enabled){
    fill(255);
    }
    else{
      fill(100);
    }
    rect(x, y, w, h);
    fill(0); textSize(24);
    text(nd, x + w/2, y + h/2);
  }
  
  void display(float x, float y, float w, float h){
    
    float dayWidth = w / 7;
    float dayHeight = h / numWeeksMonth;
    
    int numDia = 1;
    
    fill(0); textSize(36); textAlign(CENTER);
    text(months[mes-1]+"/"+any, x + w/2, y - 10);
    
    for(int f=0; f<numWeeksMonth; f++){
      if(firstDay!=1 && f==0){
        int cPrev=0;
        for(int p=firstDay, c=0; p<=numDaysPrevMonth; p++, c++){
          displayDay(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, p, false);
          cPrev++;
        }
        for(int c=cPrev; c<7; c++){
          displayDay(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, c, true);
          numDia++;
          if(numDia>numDaysMonth){
            break;
          }
        }
      }
      else {
        for(int c=0; c<7; c++){
          displayDay(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, numDia, true);
          
          numDia++;
          if(numDia>numDaysMonth){
            break;
          }
        }
      }
    }
  }
}
