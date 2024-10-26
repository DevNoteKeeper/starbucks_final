class Button {
    float x;
    float y;
    float w;
    float h;
    String text;
    color pressedcolor;
    boolean isPressed = false;

    PFont sodoBlack;

    Button(int nx, int ny, int nw, int nh, String ntext, color npressedcolor) {
        x = nx;
        y = ny;
        w = nw;
        h = nh;
        text = ntext;
        pressedcolor = npressedcolor;
        sodoBlack = createFont("sodo-sans.ttf", 45);
    }


    boolean getPressed() {
        return isPressed;
    }
    void setPressed(boolean newPressed) {
        isPressed = newPressed;
    }



    void draw() {
        if (isPressed) {
            fill(pressedcolor);  // Color when pressed
        } else if (isMouseOverButton(mouseX, mouseY)) {
            fill(200);  // Highlight color when mouse is over
        } else {
            fill(255);  // Default color
        }
        
        stroke(0);
        rect(x,y,w,h);
        
        
        fill(0);
        textAlign(CENTER, CENTER);
        textFont(sodoBlack);
        text(text, x + w / 2, y + h / 2);
    }

    boolean isMouseOverButton(float xMouse, float yMouse) {
        return xMouse >= x && xMouse <= x + w && yMouse >= y && yMouse <= y + h;

    }
}
