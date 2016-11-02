class being {
  
  //object properties. instance variables. these are the 
  //variables that are available to the object when it is instantiated 

  float radius;
  float mass;
  PVector position = new PVector(width/2,height/2);
  PVector acceleration = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  int health = 1000;
  boolean alive;

  // First version of the Being constructor;
  // the fields are assigned default values
  being() {
    radius = 10;
    mass = 1;
    position.set(width/2,height/2);
     alive = true;
  }
  
  // Second version of the Being constructor;
  // the fields are assigned with parameters
  being(PVector pos, float r) {
    position = pos.copy();
    radius = r;
     alive = true;
  }
  
  void resetAcceleration(){
    acceleration.set(0,0);
  }
  
  void checkAlive(){
     if(health <= 0){
      this.position = null;  // the being no longer has a position.
      alive = false;
    }
  }
  
  //this is the main method. it starts a chain of other method calls. 
  void live(){
   
    move();
    display();
    health -= 1;
   
  }
  
  void move(){
         keyPressed();
         velocity = acceleration.mult(mass);
         position = position.add(velocity);
         checkEndWindow();
  }
  
  //this is the function that controls key pressing for the being. it 
  //changes the value of the acceleration vector.
  void keyPressed() {
    if (keyPressed && key == CODED) {
      if (keyCode == UP) {
        acceleration.y -= .15;
      } 
      if (keyCode == DOWN) {
        acceleration.y += .15;
      } 
      if (keyCode == LEFT) {
        acceleration.x -= .15;
      }
      if (keyCode == RIGHT) {
        acceleration.x += .15;
      }
      
    } else acceleration.mult(.1); //this will slow down the being. we could think of this as friction. if we decrease the value that we multiply by, the being slows down faster.
  }
  
  void checkEndWindow(){
     if(position.x > width){
        position.x = 0;
     } else if (position.x < 0){
       position.x = width; 
     }
     
     if(position.y > height){
       position.y = 0;
     } else if (position.y < 0){
      position.y = height;
     }
  }
  
  void growHealth(float h){
    health += int(h)*20;
  }
  
  
  
  //did the being encounter a fruit?
  //we use built-in vector math to see. "boolean" at the beginning 
  //means that this function will return true or false.
  boolean checkHitFruit(fruit fruit){
    if(fruit.position.dist(being.position) < 10){ 
        
      return true;
    }  else {
      return false;
    }
  }
  
  void display() {
    ellipse(position.x, position.y, radius, radius);
    ellipse(position.x+5, position.y, radius/2, radius/2);
    ellipse(position.x, position.y+5, radius/2, radius/2);
    ellipse(position.x-5, position.y, radius/2, radius/2);
    ellipse(position.x, position.y-5, radius/2, radius/2);
  }
  
}