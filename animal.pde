class Animal{
    
    float posX, posY, originalY;
    float maxHeight = 50;
    boolean jumpingUp = true;
    boolean leftFootUp = true;
    float leftFootAngle = radians(-15);
    float rightFootAngle = radians(15);
    
    Animal(float x, float y){
        this.posX = x;
        this.posY = y;
        this.originalY = y;
    }

    void rabbit(){
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