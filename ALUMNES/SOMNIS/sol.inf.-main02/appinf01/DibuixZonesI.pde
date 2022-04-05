// FUNCIONS DE DIBUIX DE LES ZONES

void dibuixaZonaLogo() {
  bLogo.display();
}

void dibuixaSideBar() {
  fill(50, 200, 100);
  rect(marginH, 2*marginV + logoHeight, sidebarWidth, sidebarHeight);
  fill(0);
  text("SIDEBAR", marginH + sidebarWidth/2, marginV + logoHeight + sidebarHeight/2);
}

void dibuixaBanner1() {
  bSRecientes.display();
}
void dibuixaBanner2() {
  bRGrafico.display();
}
void dibuixaBanner3() {
  bBElementos.display();
}

void dibuixaCreu() {
  pushStyle();
  text("añadir sueño", W/2, H-130);
  popStyle();
 ib.display();
}
