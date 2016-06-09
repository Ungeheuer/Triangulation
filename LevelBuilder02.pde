import org.processing.wiki.triangulate.*;

ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
ArrayList triangleTypes = new ArrayList();

void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
}


void mousePressed () {
// ----- ---- add points when mouse clicked, triangulate points ---- ---- // 
  PVector p = new PVector(mouseX, mouseY, 0);
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
// ----- add a type (neutral, plus, minus) to triangles ---- //
  for (int i = 0; i < triangles.size(); i++) {
  Triangle tri = (Triangle)triangles.get(i);
   TriangleTypes triType = new TriangleTypes(tri);
 
   triangleTypes.add(triType);
   fill (triType.RandomType());
   triangle (tri.p1.x, tri.p1.y, tri.p2.x, tri.p2.y, tri.p3.x, tri.p3.y);
   
  }

}