// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Showing how to use applyForce() with box2d

class Mover {

  // We need to keep track of a Body and a radius
  float r;
  float theta;
  float cent_x, cent_y;
  float x, y;
  float speed;
  boolean reflected_last_frame = false;

  Mover (float r, float t, float x, float y, Node n) {
    this.r = r;
    this.cent_x = x;
    this.cent_y = y;
    this.theta = t;
    this.x = this.cent_x + this.r * cos (this.theta);
    this.y = this.cent_y + this.r * sin (this.theta);
    speed = random (-PI/60, PI/60);
    
    while (n.overlaps (this)) {
      this.theta += PI / 60.0;
      this.x = this.cent_x + this.r * cos (this.theta);
      this.y = this.cent_y + this.r * sin (this.theta);
    }
  }

  void update () {
    this.theta += speed;
    this.x = this.cent_x + this.r * cos (this.theta);
    this.y = this.cent_y + this.r * sin (this.theta);
    
    for (int i = 0  ;  i < nodes.length  ;  i++) {
      Node n = nodes[i];
      if (n.overlaps (this))
        n.reflect (this);
    }
  }


  void draw () {
    pushMatrix();
    translate(this.x, this.y);
    boolean overlaps = false;
    for (int i = 0  ;  i < nodes.length  ;  i++) {
      Node n = nodes[i];
      if (n.overlaps (this))
        { //println ("" + this + " overlaps " + n);
          overlaps = true;
        }
    }
    
    fill(255);
    stroke(255);

    noStroke ();
    ellipse(0, 0, 2, 2);
    popMatrix();
  }
}