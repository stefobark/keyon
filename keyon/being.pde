class being {
  float radius;
  float mass;
  PVector position = new PVector(width/2,height/2);
  PVector acceleration;
  PVector velocity;
  float health;

  
  // First version of the Being constructor;
  // the fields are assigned default values
  being() {
    radius = random(0,10);
    mass = radius * 2;
    position.set(width/2,height/2);
    health = 1000;
   
  }
  
  // Second version of the Being constructor;
  // the fields are assigned with parameters
  being(PVector pos, float r) {
    position = pos.copy();
    radius = r;
  }
  
  void live(){
    if(keyPressed){
     keyPressed(); 
    }
  }
  
  void keyPressed() {
    if (keyPressed && key == CODED) {
      if (keyCode == UP) {
        acceleration.y = 1;
      }  
      if (keyCode == DOWN) {
        acceleration.y = -1;
      } 
      if (keyCode == LEFT) {
        acceleration.x = -1;
      }
      if (keyCode == RIGHT) {
        acceleration.x += 1;
      }
    } 
  }
  
  
  boolean checkHit(PVector fruitPos){
    if(position.dist(fruitPos) < radius){
      return true;
    } else {
      return false;
    }
  }
  
  void move(){
   if(keyPressed){  //<>//
     keyPressed(); 
     velocity = acceleration.mult(mass).copy();
     position = position.add(velocity.mult( .5));
   }
  }
  
  float checkHealth(){
    return health;
  }
  
  
  //did the being encounter a fruit?
  //we use built-in vector math to see. "boolean" at the beginning 
  //means that this function will return true or false.
  boolean checkHitFruit(ArrayList<fruit> fruits){
    if(fruit.position.dist(being.position) < 10){    
      return true;
    }  else {
      return false;
    }
  }
  void display() {
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  PVector getPosition(){
    return position;
  }
}