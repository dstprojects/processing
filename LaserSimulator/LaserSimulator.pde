import controlP5.*;

Dron dr;

ControlP5 cp5;

float currentX, currentY, currentZ;
float newX, newY, newZ;
int trIndex = 0;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(20);
  background(120);
  dr = new Dron();
  dr.avel = PI/50;
  
  
  currentX = dr.pos.x;
  currentY = dr.pos.y;
  currentZ = dr.pos.z;
  
  newX = dr.pos.x;
  newY = dr.pos.y;
  newZ = dr.pos.z;
  
  cp5 = new ControlP5(this);
  cp5.addTextfield("New X").setPosition(width-120,20).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("New Y").setPosition(width-120,80).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("New Z").setPosition(width-120,140).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("Time").setPosition(width-120,200).setSize(100,30).setAutoClear(false);
  
  cp5.addTextfield("Current X").setPosition(width-240,20).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("Current Y").setPosition(width-240,80).setSize(100,30).setAutoClear(false);
  cp5.addTextfield("Current Z").setPosition(width-240,140).setSize(100,30).setAutoClear(false);

  cp5.addBang("Submit").setPosition(width-120,260).setSize(50,30);
  cp5.addBang("Sine").setPosition(width-240,260).setSize(50,30);
  cp5.addBang("Trayectoria").setPosition(width-240,200).setSize(50,30);


  
}


void draw() {
  fill(0, 7);
  noStroke();
  rect(0, 0, width, height);
  
  dr.update();
  
  currentX = dr.pos.x;
  currentY = dr.pos.y;
  currentZ = dr.pos.z;
    
  cp5.get(Textfield.class,"Current X").setValue(nf(currentX,0,2));
  cp5.get(Textfield.class,"Current Y").setValue(nf(currentY,0,2));
  cp5.get(Textfield.class,"Current Z").setValue(nf(currentZ,0,2));

  /*if (pmouseX != 0 && pmouseY != 0) {
    stroke(255, 127);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }*/
  
  
  /*if(sin){
    dr.moveSine();
  }else{
    dr.stopSine();
  }*/
  
  fill(0);
  stroke(255);
  ellipse(newX,newY,5,5);
  
  //println(frameRate);
}

void keyPressed(){
  if ( key == ' '){
    saveFrame("dronDraw####.jpg");
  }
  
}

void Submit(){
  
  newX = parseInt(cp5.get(Textfield.class,"New X").getText());
  newY = parseInt(cp5.get(Textfield.class,"New Y").getText());
  newZ = parseInt(cp5.get(Textfield.class,"New Z").getText());
  
  float time = parseInt(cp5.get(Textfield.class,"Time").getText());

  /*print("New x: "+newX+" ");
  print("New y: "+newY+" ");
  print("Time: "+time+" ");*/
  
  dr.moveDron(newX,newY,newZ,time);
}

void Sine(){
  if(dr.sine == true){
    dr.p1.x = dr.theta*dr.pos.z;
    dr.p2.x = -dr.theta*dr.pos.z;
    dr.seno = 0;
  }
  dr.sine = !dr.sine;
}

void Trayectoria(){
  
  dr.startTime = millis();
  dr.startTime1 = millis();
  dr.startTime2 = millis();
  
  dr.moverTr();
  dr.laserOnOff();
}
