import java.util.Random;
Random rand = new Random ();

final int FPS = 60;
final int BALLS_NUM = 6*FPS;
final int ICONS_NUM = 50;
final float DECREASE_ALPHA = (float) 255/(5*FPS); // each ball is visible for 5 seconds
final color BG = color (60, 240, 240); // background color
int MIN_DIM, MAX_DIM, MAX_SPEED;

Ball[] ball = new Ball[BALLS_NUM];
PGraphics[] ballIcon = new PGraphics[ICONS_NUM];
ArrayList<Ball> visibleBalls = new ArrayList<Ball>();
int i, count=0; // counters
int len=0; // 'len' = 'visibleBalls' size

void setup ()
{
  //size (400, 700, P2D);
  fullScreen (P2D);
  orientation (PORTRAIT);
  background (BG);
  frameRate (FPS);
  noStroke ();
  imageMode (CENTER);
  
  MIN_DIM = min (width, height)/20;
  MAX_DIM = min (width, height)/10;
  MAX_SPEED = min (width, height)/(FPS*3/2);
  
  loadIcons ();
  loadBalls ();
}

void draw ()
{
  if (mousePressed)
  {
    try 
    {
      visibleBalls.add (ball[ count ]);
      count++;
    }
    catch (Exception e)
    {
      visibleBalls.add (ball[0]);
      count = 1;
    }
    
    visibleBalls.get(len).initialize ();
    len++;
  }
  
  if (len > 0)
  {
    if (visibleBalls.get(0).isHidden())
    {
      // println ("alpha: " + visibleBalls.get(0).alpha);
      visibleBalls.remove (0);
      len--;
    }
    
    background (BG); // clear screen
  
    for (i=0; i < len; i++)
      visibleBalls.get(i).show ();
  }
    
  // println ("len: " + len);
  // println ("count: " + count);
  // println ("size: " + visibleBalls.size ());
}
