class OutsideScene {
  Background background;
  Animal animal;
  
  OutsideScene (Animal ani, Background bg) {
      animal = ani;
      animal.posX = 0;
      animal.posY = height-100; 
      animal.yLimit = 750;
      background = bg;

  }
  
  void restart(Animal ani) { //restart the animal to starting position
    animal = ani;
    animal.posX = 0;
    animal.posY = height-100; 
    animal.yLimit = 750; //how far the animal can go up
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
