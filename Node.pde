// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Showing how to use applyForce() with box2d

// Fixed Attractor (this is redundant with Mover)

class Node {
  
  float x, y, w, h;

  Node(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean overlaps (Mover m) {
   return (m.x >= (this.x - this.w/2)  &&  m.x <= (this.x + this.w/2)
           &&  m.y >= (this.y - this.h/2) &&  m.y <= (this.y + this.h/2));
  }

  void reflect (Mover m) {
    float dx = m.x - m.cent_x;
    float dy = m.y - m.cent_y;
    
    float theta = atan2 (dy, dx);
    println ("REFLECT: " + m.x  + "," + m.y + " t:" + m.theta % PI + " t':" + theta);
    // is it a vertical intersection?
    if (abs (m.x - (this.x - this.w/2)) < 1.0  ||  abs (m.x - (this.x + this.w/2)) < 1.0)
    { m.cent_y += 2 * dy;
      m.theta = -theta;
      println ("VERTICAL");
    } else if (abs (m.y - (this.y - this.h/2)) < 1.0  ||  abs (m.y - (this.y + this.h/2)) < 1.0){
      m.theta = PI - theta;
      m.cent_x += 2 * dx;
      println ("HORIZONTAL: " + m.x  + "," + m.y);
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    fill(255);
    noStroke();
    strokeWeight(1);
    rect(0,0,w,h);
    popMatrix();
  }
}