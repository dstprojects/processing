import controlP5.*;

Dron dr;

ControlP5 cp5;

float currentX, currentY;
float newX, newY;

void setup() {
  size(displayWidth, displayHeight);
  background(120);
  dr = new Dron();
  dr.avel = PI/100;
  
  currentX = dr.pos.x;
  currentY = dr.pos.y;
  
  newX = dr.pos.x;
  newY = dr.pos.y;
  
  cp5 = new ControlP5(this);
  cp5.addTextfield("New X").setPosition(width-120,20).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("New Y").setPosition(width-120,80).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("Time").setPosition(width-120,140).setSize(100,30).setAutoClear(false);
  
  cp5.addTextfield("Current X").setPosition(width-240,20).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("Current Y").setPosition(width-240,80).setSize(100,30).setAutoClear(false);

  cp5.addBang("Submit").setPosition(width-120,200).setSize(50,30);
  
}


void draw() {
  fill(0, 7);
  noStroke();
  rect(0, 0, width, height);
  
  dr.update();
  
  currentX = dr.pos.x;
  currentY = dr.pos.y;
    
  cp5.get(Textfield.class,"Current X").setValue(nf(currentX,0,2));
  cp5.get(Textfield.class,"Current Y").setValue(nf(currentY,0,2));

  if (pmouseX != 0 && pmouseY != 0) {
    stroke(255, 127);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  
  
  fill(0);
  stroke(255);
  ellipse(newX,newY,5,5);
}

void keyPressed(){
  if ( key == ' '){
    saveFrame("dronDraw####.jpg");
  }
  
}

void Submit(){
  
  newX = parseInt(cp5.get(Textfield.class,"New X").getText());
  newY = parseInt(cp5.get(Textfield.class,"New Y").getText());
  float time = parseInt(cp5.get(Textfield.class,"Time").getText());

  /*print("New x: "+newX+" ");
  print("New y: "+newY+" ");
  print("Time: "+time+" ");*/
  
  dr.moveDron(newX,newY,time);
}
