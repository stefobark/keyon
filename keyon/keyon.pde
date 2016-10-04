fruit fruit = new fruit();
being being = new being();
ArrayList<fruit> fruits = new ArrayList<fruit>();
String passKey;

void setup(){
  size(500,500);
  frameRate(200);
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