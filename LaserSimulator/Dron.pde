class Dron {

  PVector pos;
  PVector p1 = new PVector();
  PVector p2 = new PVector();
  float avel = 0;
  float ang = 0;
  
  boolean moving = false;
  float movingX = 0;
  float movingY = 0;
  float movingZ = 0;
  float newX;
  float newY;
  float newZ;
  float theta = 50;
  float seno = 0;

  Dron() {
    pos = new PVector(660, 460,1);
    
    p1 = new PVector(theta, 0);
    p2 = new PVector(-theta, 0);
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
    
    //println(pos.x + " " + pos.y);
    
    //println(pos.z);
    
    if(moving){
      
      dronMoving();
      
    }
  }
  
  void moveDron(float x,float y, float z, float t){
  
    if(x != pos.x || y != pos.y || z != pos.z){
      
      newX = x;
      newY = y;
      newZ = z;
      
      float moveX = x - pos.x;
      float moveY = y - pos.y;
      float moveZ = z - pos.z;
      
      movingX = (moveX/frameRate)/t;
      movingY = (moveY/frameRate)/t;
      movingZ = (moveZ/frameRate)/t;
      
      moving = true;
      
    }else{
    }
    
  }
  
  
  void dronMoving(){
  
      if(pos.x == newX && pos.y == newY && pos.z == newZ){
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
        
        if(newZ > pos.z){
        
          if(pos.z != newZ){
            if(pos.z+movingZ > newZ){
              pos.z = newZ;
            }else{
              pos.z += movingZ;
            }
          }
        }else if(newZ < pos.z){
        
          if(pos.z != newZ){
            if(pos.z+movingZ < newZ){
              pos.z = newZ;
            }else{
              pos.z += movingZ;
            }
          }
        }
        
        
      }// cierre comprabacion new x y son diferentes
      
      p1.x = theta*pos.z;
      p2.x = -theta*pos.z;
      
  }//cierre de dronMoving
  
  void moveSine(){
  
    p1.x = (theta+(sin(seno)*50))*pos.z;
    p2.x = (-theta+(sin(seno)*50))*pos.z;
    
    seno+=0.1;
  }
  
};
