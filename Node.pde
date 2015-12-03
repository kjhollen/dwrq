// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Showing how to use applyForce() with box2d

// Fixed Attractor (this is redundant with Mover)


float TOLERANCE = 3.0;

class Node {
  
  float x, y, w, h;

  Node(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean overlaps (Mover m) {
   return (m.x >= (this.x - this.w/2 - TOLERANCE)  &&  m.x <= (this.x + this.w/2 + TOLERANCE)
           &&  m.y >= (this.y - this.h/2 - TOLERANCE) &&  m.y <= (this.y + this.h/2 + TOLERANCE));
  }

  void reflect (Mover m) {
    float dx = m.x - m.cent_x;
    float dy = m.y - m.cent_y;
    
    float left_x = this.x - this.w/2, right_x = this.x + this.w/2;
    float diff_x = min (abs (left_x - m.x), abs (right_x - m.x));
    float top_y = this.y - this.h/2, bottom_y = this.y + this.h/2;
    float diff_y = min (abs (top_y - m.y), abs (bottom_y - m.y));
    
    float theta = atan2 (dy, dx);
    //println ("REFLECT: " + m + " overlaps " + this);
    // is it a vertical intersection?
    if (diff_x < diff_y) {
      m.cent_y += 2 * dy;
      m.theta = -theta;
      //println ("VERTICAL");
    } else {
      m.theta = PI - theta;
      m.cent_x += 2 * dx;
      //println ("HORIZONTAL: " + m.x  + "," + m.y);
    } /*else {
      println ("????");
      println ("m: " + m.x  + "," + m.y);
      println ("n: " + this.x  + "," + this.y);
      exit ();
    }*/
    m.x = m.cent_x + m.r * cos (m.theta);
    m.y = m.cent_y + m.r * sin (m.theta);
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    fill(0);
    noStroke();
    strokeWeight(1);
    rect(0,0,w,h);
    popMatrix();
  }
}