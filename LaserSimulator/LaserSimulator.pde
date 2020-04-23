Dron dr;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  dr = new Dron();
  dr.avel = PI/100;
}


void draw() {
  fill(0, 7);
  noStroke();
  rect(0, 0, width, height);
  
  dr.update();

  if (pmouseX != 0 && pmouseY != 0) {
    stroke(255, 127);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  //dr.pos.x += 1;
  //dr.pos.y +=1;
  
  fill(255);
  ellipse(100,100,5,5);
}

void keyPressed(){
  if ( key == ' '){
    saveFrame("dronDraw####.jpg");
  }
  
  if( key == 'm'){
  
    dr.moveDron(100,100,10);
  }
  if( key == 'e'){
  
    dr.moveDronExact();
  }
}

void InitLayout(){
  TEXTBOX cordinateX = new TEXTBOX();
  cordinateX.W = 100;
  cordinateX.H = 20;
  cordinateX.X = width-120;
  cordinateX.Y = height-20;
  
  TEXTBOX cordinateY = new TEXTBOX();
  
  TEXTBOX time = new TEXTBOX();
  
  TEXTBOX currentX = new TEXTBOX();
  TEXTBOX currentY = new TEXTBOX();
  
}
