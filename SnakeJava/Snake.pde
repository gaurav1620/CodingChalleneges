class Snake {
float x = 0;
float y = 0;
float xspeed = 1;
float yspeed = 0;
int total = 0;
ArrayList<PVector> tail = new ArrayList<PVector>();

Snake() {}

void death() {
for(int i=0; i<tail.size(); i++){
PVector pos = tail.get(i);
float d = dist(this.x, this.y, pos.x, pos.y);
if(d < 1){
println("Starting over");
this.total = 0;
this.tail.clear();
}
}
}

  void update() {
    //println(total + " " + tail.size());
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }

    x = x + xspeed*scale;
    y = y + yspeed*scale;

    x = constrain(x, 0, width-scale);
    y = constrain(y, 0, height-scale);
  }


void show() {
fill(255);
for (PVector v : tail){
rect(v.x, v.y, scale, scale);
}
rect(x,y,scale,scale);
}


void dir(float x, float y) {
this.xspeed = x;
this.yspeed = y;
}

boolean eat(PVector pos){
  float d  = dist(this.x, this.y, pos.x, pos.y);
if(d < 2){
  this.total++;
return true;
}
else{
return false;
}
}



}
/*
class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();

  Snake() {
  }

  boolean eat(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 1) {
      total++;
      return true;
    } else {
      return false;
    }
  }

  void dir(float x, float y) {
    xspeed = x;
    yspeed = y;
  }

  void death() {
    for (int i = 0; i < tail.size(); i++) {
      PVector pos = tail.get(i);
      float d = dist(x, y, pos.x, pos.y);
      if (d < 1) {
        println("starting over");
        total = 0;
        tail.clear();
      }
    }
  }

  void update() {
    //println(total + " " + tail.size());
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }

    x = x + xspeed*scl;
    y = y + yspeed*scl;

    x = constrain(x, 0, width-scl);
    y = constrain(y, 0, height-scl);
  }

  void show() {
    fill(255);
    for (PVector v : tail) {
      rect(v.x, v.y, scl, scl);
    }
    rect(x, y, scl, scl);
  }
}

*/
