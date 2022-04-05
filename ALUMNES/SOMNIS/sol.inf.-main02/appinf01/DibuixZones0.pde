
int Width0= 600;
int Height0=600;

void dibuixaFons() {
  pushStyle();
  rectMode(CENTER);
  fill(200);
  rect(width/2, height/2, 3*width/6, 9*height/10);
  popStyle();
}

void dibuixaImatge() {

  img= loadImage("user.png");
  imageMode(CENTER);
  image(img, W/2, H/2-Height0/7*2, Width0/5*2+30, Height0/5*2);

  //image(img, 8+wu, 4*hu, Width0/5*4, Height0/5*3.5);
}

void dibuixaLogin() {
  fill(0); 

  text("Username: ", width/2-250, height/2+25);
  text("Password: ", width/2-250, height/2+80);
  // Dibuixa els camps de text
  userText.display();
  passText.display();
  bEnter.display();

  if (errorLogin) {
    fill(255, 0, 0); 
    textSize(20); 
    textAlign(CENTER);
    text("Usuario i/o password incorrecto.", width/2, 450);
  }
}
