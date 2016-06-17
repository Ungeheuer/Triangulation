import org.processing.wiki.triangulate.*;

ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
ArrayList triangleTypes = new ArrayList();

int f = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
}


void mousePressed () {
  // ----- ---- add points when mouse clicked, triangulate points ---- ---- // 
  PVector p = new PVector(mouseX, mouseY, 0);
  triangleTypes.clear();
  points.add(p);
  triangles = Triangulate.triangulate(points);

  background(200);

  // ----- ---- draw points ----- ---- //    
  noStroke();
  fill(255, 0, 0);


  for (int i = 0; i < points.size(); i++) {
    p = (PVector)points.get(i);
    ellipse(p.x, p.y, 2.5, 2.5);
  }


  // ----- ----- ---- draw triangles ---- ---- ---- //
  stroke(0, 40);
  strokeWeight(1);
  fill(255, 40);
  beginShape(TRIANGLES);

  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }

  endShape();
  // ----- ----- ---- end draw triangles ---- ---- //
}

void keyPressed () { 

  // ----- randomly add a type (plus, minus) to triangles by pressing ALT ---- //
  if (key == CODED) {
    if (keyCode == ALT) {
      findTriTypes();
      makePlusOrMinus();
      //drawTriangles ();
      println ("Es gibt " + triangles.size() + " Dreicke und " 
        + triangleTypes.size() + " Dreiecktypen");
    } else if (keyCode == LEFT) {
      f--;
      moveTroughTriangles();
    } else if (keyCode == RIGHT) {
      f++;
      moveTroughTriangles();
    }
    // ----- set a type (plus, minus, start, end) to triangles ---- //
  } else {
    // add plus by pressing p, P
    if (key == 'p' || key == 'P') {
      overrideType('p');
      // add minus by pressing m, M
    } else if (key == 'm' || key == 'M') {
      overrideType('m');
      // add start by pressing s, S
    } else if (key == 's' || key == 'S') {
      setType('s');
      // add end by pressing e, E
    } else if (key == 'e' || key == 'E') {
      setType('e');
    }
  }

  drawTriangles ();

  noFill();
  strokeWeight(4);
  stroke (0, 0, 0);
  Triangle tri = (Triangle)triangles.get(f);
  triangle (tri.p1.x, tri.p1.y, tri.p2.x, tri.p2.y, tri.p3.x, tri.p3.y);
}