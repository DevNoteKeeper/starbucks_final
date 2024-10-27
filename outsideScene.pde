class OutsideScene {
  Background background;
  Animal animal;
  
  OutsideScene () {
      animal = new Animal(0, height-100,750, true, false);
      background = new Background();
  }
  
  void restart() {
    animal = new Animal(0, height-100,750, true, false);
  }
  
  void draw() {
    background.draw();
    animal.draw();
  }
  
  boolean hasEntered() {
    return animal.getY() < 760 && animal.getX() > 550 && background.isOpen;
  }
  

  void keyPressed() {
      animal.handleKeyPressed(keyCode);
  }

  void keyReleased() {
    animal.handleKeyReleased(keyCode);
  }
  


}
