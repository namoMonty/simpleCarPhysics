
public float go = 0.0;    // forward moving speed
public float turn = 0.0;  // turning speed
public float angle = 0.0; // turn

class Car{
  
  // movement speed
  public float fSpeed;
  public float rSpeed;
  
  // rect size
  public int xSize = 50;
  public int ySize = 25;
  
  // default starting point
  public int xPos = width/2;
  public int yPos = height/2;
  
 
  // constructor
  Car(float forward) {
    fSpeed = forward;
    
  }
  
  // add to Display
  void toScreen() {
    
    pushMatrix();
    // square attributes
    rectMode(CENTER);
    noStroke();
    fill(244,0,0);
    
    //square

    translate(xPos,yPos);
    rotate(angle);
    rect(0, 0, xSize, ySize);
    
    popMatrix();
    
    
  }
  void update() {
    angle += rSpeed;
    xPos += cos(angle) * fSpeed;
    yPos += sin(angle) * fSpeed;
  }
  
  int getX(){
    return xPos;
  }
  
  int getY(){
    return yPos;
  }

}


// initailize car
Car car;

void setup(){
  size(1000,1000);
  car = new Car(go);
}

void draw(){
   background(255,255,255);
   
   // add to screen
   car.update();
   car.toScreen();
   
   
   // movement (WASD)
   if (keyPressed) {
    if (key == 'd') {
      angle += 0.025;
      println("going right  " + car.rSpeed);
    }
    else if (key == 'a' ) {
      angle -= 0.025;
      println("going left  " + car.rSpeed);
    }
    else if (key == 'w') {
      car.fSpeed =  5;
    }
    else if (key == 's') {
      car.fSpeed = -2.5;
    }
   } else {
     car.fSpeed = 0; // Stop moving when no key is pressed
   }
   
   
   // collisions
   if (car.getX() <= 0+15 || car.getX() >= width-20 ){
     
     car.fSpeed = (car.fSpeed*-1); 
     println("CRASH!");
   } else if (car.getY() <= 0+15 || car.getY() >= width-20 ){
     car.fSpeed = car.fSpeed*-1; 
     println("CRASH!");
   }
   
   
    
}




  
