class Animal{
    
    float posX, posY, originalY,yLimit;
    float maxHeight = 30;
    boolean jumpingUp = true;
    boolean leftFootUp = true;
    
    boolean isRabbit;
    boolean stationary;
    
    float leftFootAngle = radians(-15);
    float rightFootAngle = radians(15);

    boolean isMoving = false;
    
    boolean moveLeft = false;
    boolean moveRight = false;
    boolean moveUp = false;
    boolean moveDown = false;
    
    
    Animal(float x, float y, float ylimit, boolean rabbit, boolean stationary){
        this.posX = x;
        this.posY = y;
        this.yLimit = ylimit;
        this.isRabbit = rabbit;
        this.originalY = y;
        this.stationary = stationary;
    }
    
    float getY() {
      return posY;
    }
    
    float getX() {
      return posX;
    }
      
    
    
    
    void draw() {
      if(isRabbit) {
        rabbit();
      }else {
        popo();
      }
      if(!stationary) {
        updatePosition();
      }
    }
    
    
    void updatePosition() {
      if(moveLeft) move(LEFT);
      if(moveRight) move(RIGHT);
      if(moveUp) move(UP);
      if(moveDown) move(DOWN);
    }
    
    void handleKeyPressed(int kcode) {
      if (kcode == LEFT) moveLeft = true;
      if (kcode == RIGHT) moveRight = true;
      if (kcode == UP) moveUp = true;
      if (kcode == DOWN) moveDown = true;
      isMoving = true;
    }
    
    void handleKeyReleased(int kcode) {
      if (kcode == LEFT) moveLeft = false;
      if (kcode == RIGHT) moveRight = false;
      if (kcode == UP) moveUp = false;
      if (kcode == DOWN) moveDown = false;
      if(!(moveLeft&&moveRight&&moveUp&&moveDown)){
        isMoving = false;
      }
    }
    
    
    
    void move(int direction){
        int moveSpeed = 5;
        
        if(direction == LEFT){
            if(posX > 10){
                posX -= moveSpeed;
            }
        }
        if(direction == RIGHT){
            if(posX < width-10){
                posX += moveSpeed;
            }
            
        }
        if(direction == UP){
            if(posY > yLimit){
                posY -= moveSpeed;
            }
            
        }
        if(direction == DOWN){
            if(posY < 950){
                posY += moveSpeed;
            }
            
        }
    }

    void rabbit(){
        drawRabbit();
        //if(!isMoving) {
        //  rabbitJump();
        //}
               
    }

    void drawRabbit(){
        pushMatrix();
        translate(posX, posY);
        noStroke();

        //ear
        fill(255);
        rotate(radians(-15));
        ellipse(-5, -30, 20, 50);
        fill(245, 189, 179);
        ellipse(-5, -32, 10, 20);

        rotate(radians(30));
        fill(255);
        ellipse(0, -30, 20, 50);
        fill(245, 189, 179);
        ellipse(0, -32, 10, 20);

        rotate(radians(-15));
        //body
        fill(255);
        ellipse(-20, 40, 100, 60);

        //head
        fill(200);
        ellipse(3, 3, 70, 60);
        fill(255);
        ellipse(0, 0, 70, 60);

        //eye
        fill(0);
        circle(8, -10, 10);

        //foot
        fill(255);
        ellipse(5, 70, 25, 15);

        ellipse(-35, 72, 25, 15);

        //tail
        circle(-70, 20, 20);
        popMatrix();


    }

    void rabbitJump(){
        if(jumpingUp){
            posY-=2;
            if(posY <= originalY - maxHeight){
                jumpingUp = false;
            }
        }else {
            posY+=2;
            if(posY >= originalY){
                posY = originalY;
                jumpingUp = true;
            }
        }
    }

    void popo(){
        drawPopo();
        popoMoveLegs();
    }

    void drawPopo(){
        rectMode(CENTER);
        fill(84, 34, 25);

        pushMatrix();
        translate(posX, posY);
        noStroke();
        //left_foot
        rotate(leftFootAngle);
        rect(-15, 80, 20, 30, 30);
        popMatrix();

        pushMatrix();
        translate(posX, posY);
        rotate(rightFootAngle);
        //right_foot
        rect(15, 80, 20, 30, 30);
        popMatrix();

        pushMatrix();
        translate(posX, posY);

        fill(84, 34, 25);
        //head_deco
        triangle(-10, -28, 10, -28, 0, -48);

        //body
        fill(255);
        rect(0, 40, 70, 80, 30);

        //head
        fill(200);
        ellipse(3, 3, 70, 60);
        fill(255);
        ellipse(0, 0, 70, 60);

        //eye
        fill(0);
        circle(8, -8, 10);

        popMatrix();   
    }

    void popoMoveLegs(){
        float angleStep = radians(1);
        if(leftFootUp){
            leftFootAngle += angleStep;
            rightFootAngle -= angleStep;
            if(leftFootAngle >= radians(10)){
                leftFootUp = false;
            }
        } else{
            leftFootAngle -= angleStep;
            rightFootAngle += angleStep;
            if(leftFootAngle <= radians(-10)){
                leftFootUp = true;
            }
        }

    }
}
