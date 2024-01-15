MaquinaTermica mt;
float sX=40, sY=35;
float areaAnada, areaTornada, areaTotal;

void setup(){
  
  size(1800, 900);
  mt = new MaquinaTermica(100, height-80);
  
  mt.setPunt(3, 12, CICLE.ANADA);
  mt.setPunt(6, 12, CICLE.ANADA);
  mt.setPunt(7, 9, CICLE.ANADA);
  mt.setPunt(13, 7, CICLE.ANADA);
  
  mt.setPunt(13, 3, CICLE.TORNADA);
  mt.setPunt(9, 3, CICLE.TORNADA);
  mt.setPunt(5, 5, CICLE.TORNADA);
  mt.setPunt(3, 10, CICLE.TORNADA);
  
  mt.updateMaxXY();
  
  println(mt.maxX, mt.maxY);
  calculaArees();
  
}

void draw(){
  background(255);
  mt.display(sX, sY);
  displayArees();
}

void displayArees(){
  fill(0); textAlign(LEFT);
  text("AREA ANADA: "+ areaAnada, 400, 100);
  text("AREA TORNADA: "+ areaTornada, 400, 150);
  text("AREA TOTAL: "+ areaTotal, 400, 200);
}

void calculaArees(){
  areaAnada = mt.calculaAreaAnada();
  areaTornada = mt.calculaAreaTornada();
  areaTotal = areaAnada - areaTornada;
}


void mouseDragged(){
  mt.checkMouseDragged(sX,sY);
  mt.updateMaxXY();
  calculaArees();
}
