
class InsideScene {
  Animal cashier;
  
  int menuX = 50;
  int menuY = 25;
  int menuWidth = 400;
  
  boolean ordered = false;
  boolean hot;
  boolean holder;
  
  Button hotbutton;
  Button coldbutton;
  Button holderbutton;
  Button orderbutton;
  
  Coffee coffee;
  
  Coffee prophot;
  Coffee propcold;
  Coffee prophotholder;
  Coffee propcoldholder;
  
  
  
  PImage starbucksLogo;
  
  
  
  InsideScene() {
    cashier = new Animal(2*width/3 - 150, height/3-40);
    hotbutton = new Button(menuX+20, menuY+20, menuWidth - 40, 40, "Hot drink", color(255,0,0));
    coldbutton = new Button(menuX+20, menuY+80, menuWidth - 40, 40, "Cold drink", color(255,0,0));
    holderbutton = new Button(menuX+20, menuY+140, menuWidth - 40, 40, "Include holder", color(150, 200, 250));
    orderbutton = new Button(menuX + 20, menuY + 200, menuWidth - 40, 40, "Order", color(0));
    
    prophot = new Coffee(600,height/3);
    propcold = new Coffee(700, height/3);
    prophotholder = new Coffee(790, height/3);
    propcoldholder = new Coffee(890, height/3);
    
    coffee = new Coffee(width/2-30,height-100);
    
    hotbutton.setPressed(true);
    starbucksLogo = loadImage("starbucksLogo.png");
  }
  
  void draw() {
    cashier.popo();
    drawCounter();
    drawMenu();
    
    hotbutton.draw();
    coldbutton.draw();
    holderbutton.draw();
    orderbutton.draw();
    
    prophot.draw(true, false);
    propcold.draw(false,false);
    prophotholder.draw(true,true);
    propcoldholder.draw(false,true);
    
    drawOrder();
  }
  
  void drawCounter() {
    rectMode(CORNER);
    fill(173, 120, 73);
    rect(0, height/3,width, height/3);
    fill(0);
    rect(0,height/3, width, 25);
    
    imageMode(CENTER);
    image(starbucksLogo, width/2, height/3+160, 300, 300);
  }
  
  void drawMenu() {
    rect(menuX,menuY,menuWidth,260);  
  }
  
  void drawOrder() {
    if(ordered) {
      coffee.draw(hot,holder);
    }
    

  }

  void handleMouseClick(float xMouse, float yMouse) {
    if(hotbutton.isMouseOverButton(xMouse, yMouse)) {
      hotbutton.setPressed(true);
      coldbutton.setPressed(false);
    }
    
    if (coldbutton.isMouseOverButton(xMouse, yMouse)) {
      hotbutton.setPressed(false);
      coldbutton.setPressed(true);
    }
    
    if (holderbutton.isMouseOverButton(xMouse, yMouse)) {
      holderbutton.setPressed(!holderbutton.getPressed());
    }
    
    if (orderbutton.isMouseOverButton(xMouse, yMouse)) {
      hot = hotbutton.getPressed();
      holder = holderbutton.getPressed();
      ordered = true;
    }
   
  }


  
  
}
