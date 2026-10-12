class Button {
  //Member variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;
  //constructor
  Button (float x, float y, char val) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    c1 = color(200);
    c2 = color(120);
    textSize(20);
    this.val = val;
    hover = false;
  }


  //member methods
  void display () {
    if (hover == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    if (val == 's') {
      text("x²", x, y);
    } else if (val == 'q') {
      text("√x", x, y);
    } else {
    text(val, x, y);
    }
  }
  void mouseOver(float tempX, float tempY) {
    if (tempX > x-w/2  && tempX < x+w/2 && tempY > y-h && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
