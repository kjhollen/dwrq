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

  Mover (float r, float t, float x, float y) {
    this.r = r;
    this.cent_x = x;
    this.cent_y = y;
    this.theta = t;
    this.x = this.cent_x + this.r * cos (this.theta);
    this.y = this.cent_y + this.r * sin (this.theta);
  }

  void update () {
    this.theta += PI / 60.0;
    this.x = this.cent_x + this.r * cos (this.theta);
    this.y = this.cent_y + this.r * sin (this.theta);
    
    for (int i = 0  ;  i < nodes.length  ;  i++) {
      Node n = nodes[i];
      if (n.overlaps (this))
        { n.reflect (this);
        }
    }
  }


  void draw () {
    pushMatrix();
    translate(this.x, this.y);
    fill(0);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,3,3);
    popMatrix();
  }
}