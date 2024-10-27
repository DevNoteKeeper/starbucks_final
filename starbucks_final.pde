Coffee coffee;
Animal animal;
Background background;
InsideScene inside;
StatusControl statusControl;

void setup() {
   size(1000, 1000);
   // background(5);
   coffee = new Coffee(width/2, height/2);
   animal = new Animal(300, 300);
   background = new Background();
   inside = new InsideScene();
   statusControl = new StatusControl(background);
}


void draw() {
  background(180);
  statusControl.updatedTime();
  // inside.draw();
  background.draw();
  animal.popo();
  
}


void mouseClicked() {
 inside.handleMouseClick(mouseX, mouseY);
}







//Coffee coffee;
//Animal animal;
//Background background;

//boolean moveLeft = false;
//boolean moveRight = false;
//boolean moveUp = false;
//boolean moveDown = false;

//void setup() {
//    size(1000, 1000);
//    // background(5);
//    coffee = new Coffee(width/2, height/2);
//    animal = new Animal(200, 850);
//    background = new Background();
//}

//void draw() {
//    background(183, 232, 255);
//    background.draw();
//    animal.popo();


//    if(moveLeft) animal.move(LEFT);
//    if(moveRight) animal.move(RIGHT);
//    if(moveUp) animal.move(UP);
//    if(moveDown) animal.move(DOWN);
//}

//void keyPressed() {
//    if (keyCode == LEFT) moveLeft = true;
//    if (keyCode == RIGHT) moveRight = true;
//    if (keyCode == UP) moveUp = true;
//    if (keyCode == DOWN) moveDown = true;
//    animal.isMoving = true;
//}

//void keyReleased() {
//    if (keyCode == LEFT) moveLeft = false;
//    if (keyCode == RIGHT) moveRight = false;
//    if (keyCode == UP) moveUp = false;
//    if (keyCode == DOWN) moveDown = false;
//    if(!(moveLeft&&moveRight&&moveUp&&moveDown)){
//        animal.isMoving = false;
//    }
    

//}
