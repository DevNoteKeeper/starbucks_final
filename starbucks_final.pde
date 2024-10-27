InsideScene inside;
OutsideScene outside;
boolean isInside = false;
void setup() {
   size(1000, 1000);
   outside = new OutsideScene();
   inside = new InsideScene();
}


void draw() {
  background(180);
  if(!isInside && outside.hasEntered()) {
    isInside = true;
  }
  if(isInside && inside.hasLeft()) {
    isInside = false;
    outside.restart();
    inside.restart();
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
