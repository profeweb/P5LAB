String[] bus1 = {"Roger", "John", "Nikos", "Marion", "Hellen"};
String[] bus2 = {"Nora", "Bill", "Eliza", "Takis", "Alex"};

String[] registre = {"Alex", "John", "Elina", "Nikos", "Leo", "Marion", "Hellen", "Nora", "Bill", "Eliza", "Takis", "Roger"};

Cua alumnes;

void setup() {

  alumnes = new Cua();

  for (int i=0; i<=4; i++) {
    alumnes.encola(bus1[i]);
  }

  for (int i=0; i<=4; i++) {
    alumnes.encola(bus2[i]);
  }


  for (int i=0; i<registre.length; i++) {

    String alumne = registre[i];
    boolean present = false;

    // Comprovam el bus1
    for (int k=0; k<bus1.length; k++) {
      if (bus1[k]==alumne) {
        present = true;
        break;
      }
    }

    // Si no està al bus1, comprovam el bus2
    if (!present) {
      for (int k=0; k<bus2.length; k++) {
        if (bus2[k]==alumne) {
          present = true;
          break;
        }
      }
    }
    // Si no està ni el bus1 ni en el bus2
    if (!present) {
      println(alumne+" no està present!");
    }
  }
}
