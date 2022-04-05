void dibuixaCerca() {
  cercaText.display();
  sfc.display();
  bCerca.display();
  selUsuario.display();
  s4.display();
}

void dibuixaResultats() {
  pc.display(50, 50, cardsW, cardsH);
  br1.display();
  br2.display();
  if (rs!=null) {
    pushStyle();
    fill(0); 
    textSize(24);
    textAlign(LEFT);
    text("SELECCIONADO:", 1200, 300);
    textSize(18);
    text("ID:"+ rs.id, 1200, 350);
    text("Título:"+ rs.title, 1200, 380);
    text("Descripción: "+ rs.description, 1200, 410);
    text("Etiquetas: "+rs.joinLabels(","), 1200, 440);
    popStyle();

    bEliminar.display();
    //bEditar.display();
  }
}
