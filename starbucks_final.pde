Coffee coffee;
void setup() {
    size(1000, 1000);
    coffee = new Coffee(width/2, height/2);
}

void draw() {
    coffee.draw();
}
