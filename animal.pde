class Animal{
    
    float posX, posY, originalY;
    float maxHeight = 50;
    boolean jumpingUp = true;
    
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

    void jump(){
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
}