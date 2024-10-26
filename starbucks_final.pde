Coffee coffee;
Animal animal;
Background background;
void setup() {
    size(1000, 1000);
    // background(5);
    coffee = new Coffee(width/2, height/2);
    animal = new Animal(300, 300);
    background = new Background();
}

void draw() {
    background(183, 232, 255);
    background.draw();

}
