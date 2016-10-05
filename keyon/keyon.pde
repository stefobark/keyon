fruit fruit = new fruit();                              //custom fruit object
being being = new being();                              //custom  object
ArrayList<fruit> fruits = new ArrayList<fruit>();       //initializing ArrayList
String passKey;                                         //declaring String variable

void setup(){
  size(500,500);
}

void draw(){
  background(0,.4);
  text("health:  "+being.health,width-300,25);
  fruit.live();
  being.live();
  if(being.checkHit(fruit.position)){
    fruit.makeNew();
  }

}
