
// Movers, jsut like before!
Mover[] movers = new Mover[1];

// Attractors, just like before!
Node[] nodes = new Node[1];

void setup() {
  size(300,300);
  smooth();
  rectMode (CENTER);
  ellipseMode (CENTER);


  int num_nodes = 1;
  int num_cols = 1;
  for (int i = 0  ;  i < num_nodes  ;  i++) {
    float x = width / 2;// + (i / num_cols - 1) * width/3;
    float y = height / 2;// + (i % num_cols - 1) * height / 3;
    nodes[i] = new Node (x, y, 100, 100);
    
    for (int j = 0; j < movers.length; j++) {
      movers[j] = new Mover(64, x /*random(width)*/, y /*random(height)*/);
    }
  }
}

void draw() {
  //background(#C10000);

  for (Node n  :  nodes) {
    n.draw();
  }
    
  for (int i = 0; i < movers.length; i++) {
    movers[i].update ();
    movers[i].draw();
  }
}