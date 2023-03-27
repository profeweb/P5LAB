// Mira si pitjam sobre els camps de text
void mousePressed() {
   n.isPressed();
   c.update();
   
   if(b1.mouseOverButton() && b1.enabled){
     // Agafar els valors dels camps del formulari
     String valorNumero = String.valueOf(c.getValue());
     String valorNom    = n.getValue();
    // Inserir a la BBDD
    insertInfoTaulaUnitat(valorNumero, valorNom);
    // Resetear camps del formulari
    resetFormulari();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    // Resetear camps del formulari
    resetFormulari();
  }
}

// Reset del Formulari
void resetFormulari(){
  c.resetValue();
  n.removeAllText();
}
