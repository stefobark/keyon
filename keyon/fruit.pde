class fruit {
  float radius;
  float mass;
  PVector position;
  PVector velocity;
  PVector acceleration; 

  fruit(){
    radius = random(0,20);
    mass = radius/2;
    position  = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void live(){
    mass += .1;     // controls rate of growth
    display();      //we have to see the fruit
  }
  
  //respawn fruit
  void makeNew(){
      position.set(random(width),random(height));
  }
  
  void display(){
    fill(0);
    stroke(255);
    ellipse(position.x,position.y,mass,mass);
    fill(255);
  }
  
}
