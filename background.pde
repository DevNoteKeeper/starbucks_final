class Background {
  float hour = 0;
  float timeSpeed = 0.05; //control speed of time
  int hourDirection = 1;
  int closeTime = 12;

  PImage starbucksLogo;
  PImage starbucksInside;
  PFont sodoBlack;
  PFont sodoSemiB;
  String status;
  boolean isOpen;

  Background(){
    starbucksLogo = loadImage("starbucksLogo.png");
    starbucksInside = loadImage("starbucksInside.jpeg");
    sodoBlack = createFont("sodo-sans.ttf", 45);
    sodoSemiB = createFont("sodo-sans-9.ttf", 30);
    status = "OPEN";
    isOpen = true;
  }


  void draw() {
    // updatedTime();
    // drawBackground(); 
    // imageMode(CORNER);
    // image(starbucksInside, 0, 300, 1000, 500, 50);
    drawDayTime();
    table();
    door();
    sign();
    logo();
    
    tick();
    
  }

  void tick() {
    hour += hourDirection * timeSpeed;
    if (hour <= 6) {
      hourDirection = 1;
    } else if (hour >= 18) {
      hourDirection = -1;
    }
  }
  
  void drawDayTime() {
    float transition = map(hour, 6, 18, 0, 1); 
    transition = constrain(transition, 0, 1);
    
    color nightColor = color(34, 40, 92);  
    color dayColor = color(92, 197, 250); 
    color skyColor = lerpColor(dayColor, nightColor, transition);  
    background(skyColor);  
  }

  void sign(){
    pushMatrix();
    translate(width/2, 150);

    noStroke();
    rectMode(CENTER);
    fill(209, 209, 209);
    rect(0, 0, 1000, 300);

    stroke(89, 89, 89, 50);
    strokeWeight(5);
    line(-500, -150, -350, -125);
    line(-500, 150, -350, 125);
    line(500, -150, 350, -125);
    line(500, 150, 350, 125);

    line(0, -150, 0, 150);
    line(200, -150, 200, 150);
    line(-200, -150, -200, 150);

    line(-500, 0, -350, 0);
    line(500, 0, 350, 0);

    noStroke();
    fill(169);
    rect(0, 0, 700, 250, 3);

    stroke(89);
    strokeWeight(5);
    
    for(int i = 10; i < 120; i+=10){
      line(10, i, 348, i);
      line(10, -i, 348, -i);
    }

    for(int i = 10; i < 120; i+=10){
      line(-10, i, -348, i);
      line(-10, -i, -348, -i);
    }

    popMatrix();
  }

  void logo(){
    
    pushMatrix();
    translate(width/2, 150);
    imageMode(CENTER);
    image(starbucksLogo, 0, -30, 200, 200);


    textAlign(CENTER, CENTER);
    textFont(sodoBlack);
    fill(200);
    text("STARBUCKS", 0, 80);

    fill(255);
    text("STARBUCKS", 2, 82);

    
    popMatrix();
    
  }

  void door(){
    pushMatrix();
    translate(width/2+50, 305);

    rectMode(CORNER);
    noStroke();
    fill(133, 139, 143);
    noFill();
    stroke(133, 139, 143);
    strokeWeight(20);
    rect(0, 0, 440, 500);

    fill(133, 139, 143);
    rect(0, 420, 220, 80);
    rect(220, 420, 220, 80);
    line(220, 0, 220, 500);

    stroke(255, 255, 255, 30);
    strokeWeight(5);
    line(220, 0, 220, 510);

    //handle
    stroke(45);
    strokeWeight(10);
    line(250, 30, 250, 400);

    toggleStatus(50, 100);

    popMatrix();

    pushMatrix();
    translate(0, 305);

    //leftWindow
    rectMode(CORNER);
    noFill();
    stroke(133, 139, 143);
    strokeWeight(20);
    rect(10, 0, 520, 500);

    stroke(255, 255, 255, 30);
    strokeWeight(5);
    line(540, 0, 540, 510);

    popMatrix();
  }



  void toggleStatus(float x, float y){
    //open&close
    //boolean isOpen
    
    pushMatrix();
    translate(x, y);

    noStroke();

    //draw open sign
    fill(255);
    rectMode(CORNER);
    rect(0,0,110,50);

    //text "open" on the sign
    isOpen = hour < closeTime;
    if(isOpen){
      status = "OPEN";
    }else{
      status = "CLOSED";
    }
    
    fill(0);
    textFont(sodoSemiB);
    textAlign(CENTER, CENTER);
    text(status, 55,25);

    popMatrix();
    
    
  }

    void table(){
      pushMatrix();
      translate(20, 575);

      fill(68);
      noStroke();
      rectMode(CORNER);

      //body
      rect(0, 0, 500, 50);

      //leg
      rect(0, 50, 20, 180);
      rect(480, 50, 20, 180);

      popMatrix();
    
    // //draw table 
    // fill(80);
    // rect(10,450,690,40); //table top
    // rect(10,490,50,150); //left leg
    // rect(650,490,50,150); //right leg
  }
}
