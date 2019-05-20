MRect r1, r2, r3, r4, r5;

void setup()
{
  size(900, 600);
  fill(55,0, 44);
  noStroke();
  r1 = new MRect(1, 134.0, 0.532, 0.1*height, 50.0, 80.0);
  r2 = new MRect(2, 44.0, 0.166, 0.3*height, 5.0, 50.0);
  r3 = new MRect(2, 58.0, 0.332, 0.4*height, 30.0, 35.0);
  r4 = new MRect(1, 120.0, 0.0498, 0.9*height, 5.0, 25.0);
  r5 = new MRect(2, 80.0, 0.876, 0.5*height, 20.0, 35.0);
}

void draw()
{
  background(200, 90, 85);

  r1.display();
  r2.display();
  r3.display();
  r4.display();
  r5.display();

  r1.move(mouseX-(width/2), mouseY+(height*0.1), 10);
  r2.move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 70);
  r3.move(mouseX/4, mouseY-(height*0.025), 40);
  r4.move(mouseX-(width/2), (height-mouseY), 30);
  r5.move((mouseX-(width/3)), (height-mouseY), 200);
}




class MRect 
{
  int w; // single bar width
  float xpos; // rect xposition
  float h; // rect height
  float ypos ; // rect yposition
  float d; // single bar distance
  float t; // number of bars

  MRect(int iw, float ixp, float ih, float iyp, float id, float it) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
    d = id;
    t = it;
  }

  void move (float posX, float posY, float damping) {
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
  }

  void display() {
    for (int i=0; i<t; i++) 
      rect(xpos+(i*(d+w)), ypos, w, height*h);
  }
}
