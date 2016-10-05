class being {
  
  //object properties. instance variables. these are the 
  //variables that are available to the object when it is instantiated 
  
  float radius;
  float mass;
  PVector position = new PVector(width/2,height/2);
  PVector acceleration = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  float health;

  // First version of the Being constructor;
  // the fields are assigned default values
  being() {
    radius = 10;
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
  
  //this is the main method. it starts a chain of other method calls. 
  void live(){
    move();
    display();
    health -= 1;
  }
  //this is the function that controls key pressing for the being. it 
  //changes the value of the acceleration vector.
  void keyPressed() {
    if (keyPressed && key == CODED) {
      
      if (keyCode == UP) {
        acceleration.y = -.1;
      }  else if (keyCode == DOWN) {
        acceleration.y = .1;
      } else {
        acceleration.y = 0;
      }
      
      if (keyCode == LEFT) {
        acceleration.x = -.1;
      } else if (keyCode == RIGHT) {
        acceleration.x = .1;
      }  else {
        acceleration.y = 0;
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
   if(keyPressed){ 
     keyPressed(); 
     velocity = acceleration.mult(mass).copy();
     position = position.add(velocity.mult(.1));
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
