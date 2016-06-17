// ---- adds a type to a triangle just drawn and returns a color ---- //
class TriangleTypes extends Triangle {
  Triangle triangle;
  char type; // plus, minus, start, end, river, etc..


  TriangleTypes(Triangle _triangle) {
    triangle = _triangle;
    type = 'n';
  }



  void RandomType () {
    float PlusOrMinus = random (0, 10);
    if (PlusOrMinus <= 5) {
      //plus is orange
      type = 'p';
    } else {
      //minus is blue
      type = 'm';
    }
    
    
  }

  // ----- generate random type and return color ---- //
  color getColor () {

    if (type == 'p') {
      return color (204, 102, 0);
    } else if (type == 'm') {
      return color (0, 102, 204);
    }
    else if (type == 's') {
      return color (255, 0, 0);
    }
    else if (type == 'e') {
      return color (0, 255, 0);
    }
    else {
       return color (255, 0, 0);
    }
  }
  
}