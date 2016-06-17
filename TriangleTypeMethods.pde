void findTriTypes () {

  for (int i = 0; i < triangles.size(); i++) {
    boolean hasTriType = false;
    Triangle tri = (Triangle)triangles.get(i);

    for (int j = 0; j < triangleTypes.size(); j++) {
      TriangleTypes triType = (TriangleTypes)triangleTypes.get(j);
      if (triType.triangle == tri) {
        hasTriType = true;
        break;
      }
    }

    if (!hasTriType) {
      println ("HASTRITYPE");
      TriangleTypes triType = new TriangleTypes(tri);
      triangleTypes.add(triType);
    }
  }
}

void makePlusOrMinus () {

  for (int j = 0; j < triangleTypes.size(); j++) {
    TriangleTypes triType = (TriangleTypes)triangleTypes.get(j);
    triType.RandomType();
  }
}

void drawTriangles () {
  background(200, 200, 200);
  strokeWeight (1);
   stroke (90,90,90);
    
  for (int j = 0; j < triangleTypes.size(); j++) {
    TriangleTypes triType = (TriangleTypes)triangleTypes.get(j);
    
    fill (triType.getColor());
    Triangle tri = triType.triangle;
    triangle (tri.p1.x, tri.p1.y, tri.p2.x, tri.p2.y, tri.p3.x, tri.p3.y);
  }
}

void moveTroughTriangles () {
  if (f >= triangles.size ()) {
    f = 0;
  } else if (f < 0) {
    f = triangles.size()-1;
  }
  
  drawTriangles ();
  
  noFill();
  strokeWeight(4);
  stroke (0, 0, 0);
  Triangle tri = (Triangle)triangles.get(f);
  triangle (tri.p1.x, tri.p1.y, tri.p2.x, tri.p2.y, tri.p3.x, tri.p3.y);
  
}