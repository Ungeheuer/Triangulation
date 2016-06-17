// --- findTriTypes checks if types are already attached and adds them if not --- //
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
   // ----- use left / right key to navigate through the triangles ---- //
  if (f >= triangles.size ()) {
    f = 0;
  } else if (f < 0) {
    f = triangles.size()-1;
  }
}

// --- overrideType is called by typing in a char and overrides the triangle type to plus / minus --- //
void overrideType(char c) {
  TriangleTypes triType = (TriangleTypes)triangleTypes.get(f);
  triType.type = c;
}

// --- setType is called by typing in a char and sets the triangle type to start / end--- //
void setType(char c) {
  for (int j = 0; j < triangleTypes.size(); j++) {
    TriangleTypes triType = (TriangleTypes)triangleTypes.get(j);
    if (triType.type == c) {
      triType.RandomType();
      break;
    }
  }
  TriangleTypes triType = (TriangleTypes)triangleTypes.get(f);
  triType.type = c;
}