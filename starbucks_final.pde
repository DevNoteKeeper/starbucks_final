Coffee coffee;
Animal animal;
void setup() {
    size(1000, 1000);
    // background(5);
    coffee = new Coffee(width/2, height/2);
    animal = new Animal(300, 300);
}

void draw() {
    background(220);
    coffee.draw();
    animal.rabbit();
    animal.jump();
}
