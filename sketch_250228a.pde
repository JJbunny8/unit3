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

//variables
color selectedColor;
float sliderY;
float thickness;

void setup() {
  size(800, 600);
  background(255);
  selectedColor = red;
  flower = loadImage ("Flower.png");
  flowerOn = false;
  sliderY = 30;
  thickness = 2;
}

void draw() {
  fill(255);
  //toolbar
  stroke(0);
  strokeWeight(0);
  fill(grey);
  rect(650, 0, 150, 800);

  //flower button
  tactile(0, 0, 100, 100);
  flowerOnOff();
  rect(0, 0, 100, 100);
  image(flower, 0, 0, 100, 100);

  //colour buttons
  strokeWeight(2);

  tactile(725, 30, 15);
  fill(red);
  circle(725, 30, 30);

  tactile(775, 30, 15);
  fill(orange);
  circle(775, 30, 30);

  tactile(725, 80, 15);
  fill(yellow);
  circle(725, 80, 30);

  tactile(775, 80, 15);
  fill(green);
  circle(775, 80, 30);

  tactile(725, 130, 15);
  fill(teal);
  circle(725, 130, 30);

  tactile(775, 130, 15);
  fill(blue);
  circle(775, 130, 30);

  tactile(725, 180, 15);
  fill(purple);
  circle(725, 180, 30);

  tactile(775, 180, 15);
  fill(pink);
  circle(775, 180, 30);
  
  //slider
  strokeWeight(2);
  stroke(255);
  tactile(680, 20 - 220, 15);
  line(680, 20, 680, 200);
  fill(255);
  circle(680, sliderY, 20);

}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(0);
  } else {
    stroke(255);
  }
}

void mouseDragged() {
  if (flowerOn == false) {
    //squiggly line
    strokeWeight(thickness);
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //flower drawing
    image(flower, mouseX, mouseY, 100, 100);
    
  }
   controlSlider();
   
   
}

void mouseReleased() {
  //flower button
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100) {
    flowerOn = !flowerOn;
  }
  
  //red button
  if (dist(725, 30, mouseX, mouseY) < 15) {
    selectedColor = red;
  }

  //orange button
  if (dist(775, 30, mouseX, mouseY) < 15) {
    selectedColor = orange;
  }

  //yellow button
  if (dist(725, 80, mouseX, mouseY) < 15) {
    selectedColor = yellow;
  }

  //green button
  if (dist(775, 80, mouseX, mouseY) < 15) {
    selectedColor = green;
  }
  //teal button
  if (dist(725, 130, mouseX, mouseY) < 15) {
    selectedColor = teal;
  }

  //blue button
  if (dist(775, 130, mouseX, mouseY) < 15) {
    selectedColor = blue;
  }
  //purple button
  if (dist(725, 180, mouseX, mouseY) < 15) {
    selectedColor = purple;
  }

  //pink button
  if (dist(775, 180, mouseX, mouseY) < 15) {
    selectedColor = pink;
  }
  
   controlSlider();
   
}

void controlSlider() {
  if (mouseY > 20 && mouseY < 220 && mouseX > 670 && mouseX < 690) {
    sliderY = mouseY;
  }    
    thickness = map(sliderY, 20, 220, 1, 80);
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w  && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
  
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
