class Coffee{
    float posX, posY;
    
    Coffee(float x, float y){
        this.posX = x;
        this.posY = y;
    }


    void draw(boolean hot, boolean holder){
        if(hot) {
          hotcup();
          if(holder) {
            hotcupHolder();
          }
          logo(25, -38, 10, 20);
        }else {
          icecup();
          if(holder) {
            icecupHolder();
          }
          logo(20, -40, 20, 30);
        }
        
    }
    
    void changePosition(float x, float y) {
      posX = x;
      posY = y;
    }
    

    void icecup(){
        rectMode(CENTER);
        pushMatrix();
        translate(posX, posY);
        fill(228, 229, 231);

        //cup_body
        strokeWeight(5);
        stroke(84, 34, 25);
        quad(0, 0, 40, 0, 50, -80, -10, -80);

        //cup_light
        fill(255);
        noStroke();
        quad(2, -2, 5, -2, 0, -80, -8, -80);
        
        
        stroke(84, 34, 25);
        strokeWeight(5);
        //cup_lid
        fill(228, 229, 231);
        arc(20, -80, 35*2, 35*2, -PI, 0);

        fill(195, 107, 45);
        rect(20, -85, 80, 15, 100);
        popMatrix();
        
    }

    void icecupHolder(){
        pushMatrix();
        translate(posX, posY);
        //holder
        fill(214, 187, 133);
        strokeWeight(5);
        stroke(84, 34, 25);
        quad(-5, -20, 45, -20, 50, -60, -10, -60);

        popMatrix();
        
    }

    void hotcup(){
        rectMode(CENTER);
        pushMatrix();
        translate(posX, posY);
    
        //cup_body
        fill(214, 187, 133);
        strokeWeight(5);
        stroke(84, 34, 25);
        quad(0, 0, 50, 0, 60, -70, -10, -70);

        //cup_light
        fill(255);
        noStroke();
        quad(2, -2, 10, -2, 5, -70, -5, -70);
    
        stroke(84, 34, 25);
        strokeWeight(5);

        fill(227, 230, 233);
        rect(25, -75, 90, 15, 100);
        popMatrix();
        
    }
    void hotcupHolder(){
        pushMatrix();
        translate(posX, posY);
        //holder
        fill(74, 125, 66);
        strokeWeight(5);
        stroke(84, 34, 25);
        quad(-3, -20, 53, -20, 57, -55, -7, -55);

        popMatrix();
        
    }

    void logo(int x, int y, int w, int h){
        //coffeebean
        pushMatrix();
        translate(posX+x, posY+y);
        fill(84, 34, 25);
        rotate(radians(-30)); 
        ellipse(0, 0, w, h);

        stroke(0);
        strokeWeight(3);
        line(0, -10, 0, 10);
        popMatrix();
    }
}
    
    
