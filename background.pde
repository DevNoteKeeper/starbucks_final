class Background {
  float hour = 0;
  float timeSpeed = 0.02; //control speed of time
  int hourDirection = 1;
  int closeTime = 12;

  PImage starbucksLogo;
  PImage starbucksInside;
  PFont sodoBlack;
  PFont sodoSemiB;
  String status;
  boolean isOpen;
  float currentTime;

  Background(){
    starbucksLogo = loadImage("starbucksLogo.png");
    starbucksInside = loadImage("starbucksInside.jpeg");
    sodoBlack = createFont("sodo-sans.ttf", 45);
    sodoSemiB = createFont("sodo-sans-9.ttf", 30);
    status = "OPEN";
    isOpen = true;
  }


  void draw() {
    road();
    table();
    door();
    sign();
    logo();    
  }

  void road(){
    fill(220);
    rectMode(CORNER);
    rect(0, 800, 1000, 200);
  }
  
  void drawDayTime(float time) {
    color skyColor;
    color dawnColor = color(173, 216, 230);
    color dayColor = color(92, 197, 250);
    color nightColor = color(34, 40, 92); 
    currentTime = time;

    if(currentTime >=8 && currentTime <= 12){
      float transition = map(currentTime, 8, 12, 0, 1);
      skyColor = lerpColor(dawnColor, dayColor, transition);
    } else if(currentTime > 12 && currentTime <= 18){
      skyColor = dayColor;
    } else if(currentTime > 18 && currentTime <= 24){
      float transition = map(currentTime, 18, 24, 0, 1);
      skyColor = lerpColor(dayColor, nightColor, transition);
    } else{
      float transition = map(currentTime, 0, 8, 0, 1);
      skyColor = lerpColor(nightColor, dawnColor, transition);
    }
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

    toggleStatus(50, 100, currentTime);

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



  void toggleStatus(float x, float y, float currentTime){
    pushMatrix();
    translate(x, y);

    noStroke();

    //draw open sign
    fill(255);
    rectMode(CORNER);
    rect(0,0,110,50);

    //text "open" on the sign
    if(currentTime>=8 && currentTime <= 20){
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
    
  }
}
