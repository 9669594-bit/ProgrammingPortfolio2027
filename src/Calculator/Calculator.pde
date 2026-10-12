// Jayden Liu | Sept 14 2026 | Calculator

String displayVal;
float l, r, result;
char op;
boolean left, newEntry;

Button[]numButtons = new Button[10];
Button[]opButtons = new Button[12];

void setup() {
  size(500, 600);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = '0';
  left = true;
  newEntry = true;

  numButtons[0] = new Button(100.0, 425.0, '0');
  numButtons[1] = new Button(100.0, 200.0, '1');
  numButtons[2] = new Button(175.0, 200.0, '2');
  numButtons[3] = new Button(250.0, 200.0, '3');
  numButtons[4] = new Button(100.0, 275.0, '4');
  numButtons[5] = new Button(175.0, 275.0, '5');
  numButtons[6] = new Button(250.0, 275.0, '6');
  numButtons[7] = new Button(100.0, 350.0, '7');
  numButtons[8] = new Button(175.0, 350.0, '8');
  numButtons[9] = new Button(250.0, 350.0, '9');
  opButtons[0] = new Button(325.0, 200.0, '+');
  opButtons[1] = new Button(325.0, 275.0, '-');
  opButtons[2] = new Button(325.0, 350.0, 'x');
  opButtons[3] = new Button(325.0, 425.0, '÷');
  opButtons[4] = new Button(325.0, 500.0, '±');
  opButtons[5] = new Button(400.0, 200.0, 'C');
  opButtons[6] = new Button(400.0, 275.0, '.');
  opButtons[7] = new Button(400.0, 350.0, '=');
  opButtons[8] = new Button(400.0, 425.0, 'q');
  opButtons[9] = new Button(400.0, 500.0, 's');
  opButtons[10] = new Button(100.0, 500.0, ' ');
  opButtons[11] = new Button(175.0, 500.0, ' ');
}

void draw () {
  background(30);
  updateDisplay();
  for (int i = 0; i< numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i< opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }


  rectMode (CENTER);
  textAlign (CENTER);
}

void updateDisplay () {
  // Background shape
  rectMode(CENTER);
  fill(180);
  rect(250, 100, 400, 50, 20);

  //Overlay text
  fill(0);
  textAlign(RIGHT);
  text(displayVal, 250, 100);
}


void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
    );
}




void mouseReleased() {
  //update display button mouse click
  for (int i = 0; i < numButtons.length; i ++) {
    if (numButtons[i].hover == true) {
      String digit = str(numButtons[i].val);

      if (newEntry || displayVal.equals("0.0")) {
        // Replace value if 0.0
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
    }
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  }


  for (int i = 0; i < opButtons.length; i ++) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].val;


      if (clicked == '=') {
        performCal();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal += str(op);
      } else if (clicked == '±') {
        toggleSign();
      } else if (clicked == 'C') {
        //resets all variables
        displayVal = "0.0";
        l = 0.0;
        r = 0.0;
        result = 0.0;
        op = '0';
        left = true;
        newEntry = true;
      } else if (clicked == 'q') {
        //square root of value
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      } else if (clicked == 's') {
        //squares
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }
  }
  printState();
}






void toggleSign() {
  if (left) {
    result = l * -1;
  } else {
    result = r *-1;
  }
  displayVal = str(result);
}

void performCal() { //creates the logic for + - x and ÷
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    } else {
      result = l / r;
    }
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }
  displayVal = str(result);
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1" + keyCode);
    handleEvent('1', true);
  } else if (key == '2') {
    println("You hit 2" + keyCode);
    handleEvent('2', true);
  } else if (key == '3') {
    println("You hit 3" + keyCode);
    handleEvent('3', true);
  } else if (key == '4') {
    println("You hit 4" + keyCode);
    handleEvent('4', true);
  } else if (key == '5') {
    println("You hit 5" + keyCode);
    handleEvent('5', true);
  } else if (key == '6') {
    println("You hit 6" + keyCode);
    handleEvent('6', true);
  } else if (key == '7') {
    println("You hit 7" + keyCode);
    handleEvent('7', true);
  } else if (key == '8') {
    println("You hit 8" + keyCode);
    handleEvent('8', true);
  } else if (key == '9') {
    println("You hit 9" + keyCode);
    handleEvent('9', true);
  } else if (key == '0') {
    println("You hit 0" + keyCode);
    handleEvent('0', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum) {
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      // Replace value if 0.0
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }


    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    //other stuff
  }
}
