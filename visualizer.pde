import oscP5.*;
OscP5 oscP5;

int bufferSize;
int leftT = 0;
int rightT = 0;

void setup(){
   size(1280, 720);
   pixelDensity(2);
  oscP5 = new OscP5(this,12000);
  /* You define there with "/test" the message that come from Max,
  like an object [prepend /test].
  With "result" you define a name to construct a function inside Processing */
  oscP5.plug(this,  "updateBufferSize","/buffer-size");
  oscP5.plug(this,  "playLeft","/play-left");
  oscP5.plug(this,  "playRight","/play-right");
}


void draw() {
  leftT++;
  rightT++;
  background(0, 2);
  noFill();
  stroke(#ffffff);
  
  float radius = height * 0.8;
  float leftPulseRadius = radius + leftT;
  float rightPulseRadius = radius + rightT;
  float leftMove = leftT;
  float rightMove = rightT;
  ellipse(width/2, height/2, radius, radius);
  
  stroke(255, 0, 0);
  arc(width/2 - leftMove, height/2, leftPulseRadius, leftPulseRadius, HALF_PI, PI + HALF_PI);
  arc(width/2 + rightMove, height/2, rightPulseRadius, rightPulseRadius, -HALF_PI, HALF_PI);
}


// The function must be public 
public void updateBufferSize(int milliseconds) {
   /*The cool thing is that you can send from [prepend /test] three message,
  inside a pack object for example, that have three different "type" of values*/
   println("Updated buffer size: " + milliseconds);
   bufferSize = milliseconds;
}

public void playLeft(String bang) {
   /*The cool thing is that you can send from [prepend /test] three message,
  inside a pack object for example, that have three different "type" of values*/
   println("Play left");
   leftT = 0;
}

public void playRight(String bang) {
   /*The cool thing is that you can send from [prepend /test] three message,
  inside a pack object for example, that have three different "type" of values*/
   println("Play right");
   rightT = 0;
}
