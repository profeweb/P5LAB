
void dibuixaPagina() {
  pushStyle();
  fill(100);
  rectMode(CENTER);
  rect(W/2, H/2, pageWidth, pageHeight);
  fill(0);
  text("somni escrit", W/2, H/2); 
  popStyle();
  bGuardar.display();  
}

void dibuixaPopup(){
  pop.display();
}

void dibuixaConfirm(){
  conf.display();
}

void dibuixaInserirDream() {
  fill(colorC); 
  textSize(20); 
  textAlign(LEFT);
  text("Añadir sueño", 250, height/30*4.5); 
  fill(0); 
  textSize(48); 
  textAlign(LEFT);
  areaText.display();
}
void dibuixaBotons() {
  bGuardar.display();
  //bEliminar.display();
}

void dibuixaCalendari() {
  if (viewCalendar) {
    c.display();
  }
  bFecha.display();
}
void dibuixaTittleDream() {
  fill(150); 
  textSize(20); 
  textAlign(LEFT);
  text("Añadir título", 250, height/30*1.5);
  tittleDream.display();
}

void dibuixaSwitch() {
  b1.display();
}
void dibuixaSelect() {
  selCategoria.display();
  selEmail.display();
}

void dibuixaFiltres() {
  sfa.display();
}
void dibuixaCheckBoxList() {
  //cbl.display();
}
