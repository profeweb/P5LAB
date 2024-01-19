
class Llista {

  Node head, tail;
  int num;

  Llista() {
    head = null;
    tail = null;
    num = 0;
  }

  // Afegir al principi
  void prepend(int v) {
    if (!isEmpty()) {
      Node n = new Node(v, head);
      head = n;
    } else {
      Node n = new Node(v);
      head = n;
      tail = n;
    }
    num++;
  }

  // Afegir al final
  void append(int v) {
    if (!isEmpty()) {
      Node n = new Node(v);
      tail.seg = n;
      tail = n;
    } else {
      Node n = new Node(v);
      head = n;
      tail = n;
    }
    num++;
  }

  // Està buida?
  boolean isEmpty() {
    return head==null;
    // return num==0;
  }

  // Número d'elements de la llista (v1)
  int numElements() {
    return num;
  }

  // Número d'elements de la llista (v2)
  int numElements2() {
    int n = 0;
    Node x = head;
    while (x!=null) {
      x = x.seg;
      n++;
    }
    return n;
  }

  // Retorna l'element a la posició i
  int getElementAt(int i) {
    if (i<num && !isEmpty()) {
      int k=0;
      Node n = head;
      while (k<i-1) {
        n = n.getSegNode();
        k++;
      }
      return n.getValor();
    } else {
      return -1;
    }
  }

  // Retorna el primer element de la llista
  int getFirst() {
    return getElementAt(0);
  }

  // Retorna el darrer element de la llista
  int getLast() {
    return getElementAt(num-1);
  }

  // Elimina l'element de la llista a la posició p
  int removeAt(int p) {
    if (p<num && !isEmpty()) {
      int k=0;
      Node nodeAnt = head;
      while (k<p-1) {
        nodeAnt = nodeAnt.getSegNode();
        k++;
      }

      int v = -1;
      if (num>1) {
        Node n = nodeAnt.getSegNode();
        v = n.valor;
        nodeAnt.seg = n.getSegNode();
      } else {
        v = nodeAnt.valor;
        tail = null;
        head = null;
      }
      num--;
      return v;
    }
    return -1;
  }

  // Insereix un element amb valor v a la posició p de la llista
  void insertAt(int p, int v) {
    if (p==0) {
      prepend(v);
    } else if (p == num-1) {
      append(v);
    } else if (p<num && !isEmpty()) {
      int k=0;
      Node nodeAnt = head;
      while (k<p-1) {
        nodeAnt = nodeAnt.getSegNode();
        k++;
      }
      Node nodeSeg = nodeAnt.getSegNode();
      Node nouNode = new Node(v, nodeSeg);
      nodeAnt.seg = nouNode;
      num++;
    }
  }

  // Dibuixa la llista de nodes a la posició (x, y) i amb mida de node wn
  void display(int x, int y, int wn) {

    if (!isEmpty()) {

      Node n = head;
      int i = 0;
      do {
        n.display(x + 2*i*wn, y, wn);
        n = n.getSegNode();
        i++;
      } while (n!=null);
    }

    fill(0); 
    textAlign(CENTER);
    text("HEAD", x + wn/2, y -50);
    line(x + wn/2, y - wn, x + wn/2, y);
  }

  // Recorre i imprimeix llista
  void printList() {
    print("Contingut de la Llista:");
    if (!isEmpty()) {
      Node n = head;
      int i = 0;
      do {
        print(" " + n.valor);
        n = n.getSegNode();
        i++;
      } while (n!=null);
    }
  }
}
