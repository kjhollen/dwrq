
// Movers, jsut like before!
int movers_per = 1000;
Mover[] movers = new Mover[movers_per * 9];

// Attractors, just like before!
Node[] nodes = new Node[9];

void setup() {
  size(1920,1080);
  smooth();
  rectMode (CENTER);
  ellipseMode (CENTER);


  int num_nodes = 9;
  int num_cols = 3;
  
  // make all nodes first
  for (int i = 0  ;  i < num_nodes  ;  i++) {
    float x = width / 2 + (i / num_cols - 1) * width / 10;
    float y = height / 2 + (i % num_cols - 1) * height / 6;
    nodes[i] = new Node (x, y, 50, 50);
  }
  
  for (int i = 0  ;  i < num_nodes  ;  i++) {
    for (int j = movers_per * i; j < movers_per * (i + 1) ; j++) {
      movers[j] = new Mover(random (32, 64), random (-PI, PI),
                            random(nodes[i].x - 50, nodes[i].x + 50),
                            random(nodes[i].y - 50, nodes[i].y + 50),
                            nodes[i]);
    }
  }
  noCursor ();
}

void draw() {
  background(255, 0, 0);
    
  for (int i = 0; i < movers.length; i++) {
    movers[i].update ();
    movers[i].draw();
  }
  
  for (Node n  :  nodes) {
    n.draw();
  }
}