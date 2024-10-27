InsideScene inside;
OutsideScene outside;
StatusControl statusControl;
Background background;
Animal selectedAnimal;
Animal[] animals;
boolean isInside = false;
void setup() {
   size(1000, 1000);
   animals = new Animal[2];
   for(int i = 0;i < 2;i++) {
        animals[i] = new Animal(0, height - 100, 750, i==0, false);  // rabbit when i==0, popo when i == 1

   }
  
   selectedAnimal = animals[int(random(0, animals.length))];
   background = new Background();
   statusControl = new StatusControl(background);

   outside = new OutsideScene(selectedAnimal, background);
   inside = new InsideScene(selectedAnimal);
}


void draw() {
  background(180);
  statusControl.updatedTime();

  if(!isInside && outside.hasEntered()) {
    isInside = true;
    inside.restart(selectedAnimal);
  }
  if(isInside && inside.hasLeft()) {
    isInside = false;
    selectedAnimal = animals[int(random(0, animals.length))];
    inside.restart(selectedAnimal);
    outside.restart(selectedAnimal);
  }
  
  
  if(isInside) {
    inside.draw();
  }else {
    outside.draw();
  }
  
}


void mouseClicked() {
 inside.handleMouseClick(mouseX, mouseY);
}

void keyPressed() {
    if(isInside) {
      inside.keyPressed();
    }else {
      outside.keyPressed();
    }
}

void keyReleased() {
  if(isInside) {
      inside.keyReleased();
  }else {
    outside.keyReleased();
  }
}
