fruit fruit = new fruit();                              // custom object : feeds main character
being being = new being();                              // custom object : main character
int score;

void setup(){
  size(500,500);                                        // size of the window

}

void draw(){
 
  background(0);
  text("health:  "+being.health,width-300,25);
  text("score:  "+ score,width-300,50);
  being.checkAlive();
  if(being.alive == true){
    fruit.live();
    being.live();

    if(being.checkHitFruit(fruit)){
      score += 1;
      being.growHealth(fruit.radius);
      fruit.makeNew();
    }
  } else {
      text("you lose",width/2-25,100);
  }
}
