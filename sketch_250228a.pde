//Jennifer Wu
//Feb 28, 2025
//2-3

PImage flower;

void setup() {
  size(800, 600);
  background(255);
  flower = loadImage ("Pink Flower.png");
}

void draw() { 
  image(flower, 50, 50, 100, 100);
  
  
}

void mouseDragged() {
  
  //line(pmouseX, pmouseY, mouseX, mouseY);
  
}
