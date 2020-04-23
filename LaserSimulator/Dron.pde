class Dron {

  PVector pos;
  PVector p1 = new PVector();
  PVector p2 = new PVector();
  float avel = 0;
  float ang = 0;
  
  boolean moving = false;
  float movingX = 0;
  float movingY = 0;
  float newX;
  float newY;

  Dron() {
    pos = new PVector(660, 460);
    
    p1 = new PVector(100, 0);
    p2 = new PVector(-100, 0);
  }

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    fill(255);
    ellipse(p1.x, p1.y, 5, 5);
    ellipse(p2.x, p2.y, 5, 5);
    ang += avel;
    popMatrix();
    
    println(pos.x + " " + pos.y);
    
    if(moving){
      
      dronMoving();
      
    }//cierre de if moving
  }
  
  void moveDron(float x,float y, float t){
  
    if(x != pos.x || y != pos.y){
      
      newX = x;
      newY = y;
      
      float moveX = x - pos.x;
      float moveY = y - pos.y;
      
      movingX = (moveX/frameRate)/t;
      movingY = (moveY/frameRate)/t;
      
      moving = true;
      
    }else{
    }
    
  }
  
  void moveDronExact(){
  
    pos.x = 660;
    pos.y = 460;
  }
  
  void dronMoving(){
  
      if(pos.x == newX && pos.y == newY){
        moving = false;
      }else{
        if(newX > pos.x){
        
          if(pos.x != newX){
            if(pos.x+movingX > newX){
              pos.x = newX;
            }else{
              pos.x += movingX;
            }
          }
        }else if(newX < pos.x){
        
          if(pos.x != newX){
            if(pos.x+movingX < newX){
              pos.x = newX;
            }else{
              pos.x += movingX;
            }
          }
        }
        
        if(newY > pos.y){
        
          if(pos.y != newY){
            if(pos.y+movingY > newY){
              pos.y = newY;
            }else{
              pos.y += movingY;
            }
          }
        }else if(newY < pos.y){
        
          if(pos.y != newY){
            if(pos.y+movingY < newY){
              pos.y = newY;
            }else{
              pos.y += movingY;
            }
          }
        }
      }// cierre comprabacion new x y son diferentes
  
  }
  
};
