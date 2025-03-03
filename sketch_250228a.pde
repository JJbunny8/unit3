//Jennifer Wu
//Feb 28, 2025
//2-3

//colour pallette
color red =    #FFADB6;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green =  #CAFFBF;
color teal =   #9BF6FF;
color blue =   #A0C4FF;
color purple = #BDB2FF;
color pink =   #FFC7D7;
color grey =   #393A41;

PImage flower;
boolean flowerOn; //true or false

void setup() {
  size(800, 600);
  background(255);
  flower = loadImage ("Flower.png");
  flowerOn = false;
}

void draw() {
  fill(255);
  //toolbar
  stroke(0);
  strokeWeight(1);
  fill(grey);
  rect(650, 0, 150, 800);

  //flower button
  tactile(0, 0, 100, 100);
  flowerOnOff();
  rect(0, 0, 100, 100);
  image(flower, 0, 0, 100, 100);
}

void mouseDragged() {
  if (flowerOn == false) {
    //squiggly line
    strokeWeight(3);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //flower drawing
    image(flower, mouseX, mouseY, 100, 100);
  }
}

void mouseReleased() {
  //flower button
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100) {
    flowerOn = !flowerOn;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w  && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}

void flowerOnOff() {
  if (flowerOn == true) {
    stroke(255, 0, 0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}
