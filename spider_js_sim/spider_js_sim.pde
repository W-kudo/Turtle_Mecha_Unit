import processing.serial.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;
import java.util.List;

final int MOTION_STOP=0,MOTION_FORWARD=1,MOTION_BACK=2,MOTION_LEFT=3,MOTION_RIGHT=4,MOTION_LEFTTURN=5,MOTION_RIGHTTURN=6,MOTION_RESET=7,MOTION_LLAtack=8,MOTION_SHOOT=9;
String motionName[]={"stop","forward","back","left","right","leftturn","rightturn","reset","leftlegatack","shoot"};

boolean sim = true;//KingSpiderのシミュレーションを表示する（true）か，表示しない（false）か
boolean ser = true;//実機（シリアルポート）をつなげている（true）か，つなげていない（false）か
int serialPortNum = 0;//接続されているシリアルポート番号に応じて変更すること
boolean win = true;//Windows PC なら true，Mac なら falseに変更すること
//boolean win = false;//Windows PC なら true，Mac なら falseに変更すること
int headUD=0;
Serial myPort;
ControlIO control;
ControlDevice gpad;
ControlSlider[] slider = new ControlSlider[4];
ControlButton[] button = new ControlButton[12];
ControlHat[]    hat    = new ControlHat[1];
List<ControlDevice> list;

// A, B, X, Y, LA, RA, LB, RB, LT, RT, Back, Start, Hat
int[][] pair = {
  {1, 2, 0, 3, 10, 11, 4, 5, 6, 7, 8, 9, 12}, //Mac
  {2, 3, 1, 4, 11, 12, 5, 6, 7, 8, 9, 10, 0} //Win
};

int stime, sequence = 0, motionID = 0;

int torque = 1;  // モータトルクの初期設定
int speed  = 400; // 速度の初期設定
char str;
boolean isShiftDown = false;

int slider_LX, slider_LY, slider_RX, slider_RY, slider_FR;
int button_A, button_B, button_X, button_Y;
int button_LA, button_RA, button_LB, button_RB, button_LT, button_RT, button_Back, button_Start;
int hat_XY;

KingSpider king_spider;//KingSpiderのシミュレーションのクラス
void settings(){
    size(825, 650); //window size
}
void setup() {
  control = ControlIO.getInstance(this);
  list = control.getDevices();
  printArray(list);
  for (ControlDevice dev : list) {
    if ( dev.getTypeName() == Controller.Type.STICK.toString() ) {
      gpad = dev;
      gpad.open();
      break;
    }
  }
  if (gpad == null) {
    println("ERROR: No available device is found.");
    System.exit(-1); // End the program NOW!
  }
  slider[0] = gpad.getSlider(0);  // Left  stick Up-Down
  slider[1] = gpad.getSlider(1);  // Left  stick Left-Right
  slider[2] = gpad.getSlider(2);  // Right stick Up-Down
  slider[3] = gpad.getSlider(3);  // Right stick Left-Right

  int pc;
  if (win) {
    pc = 1;
  } else {
    pc = 0;
  }
  button[0] = gpad.getButton(pair[pc][0]);  // button_A
  button[0].plug(this, "A_ButtonPress", ControlIO.ON_PRESS);
  button[0].plug(this, "A_ButtonRelease", ControlIO.ON_RELEASE);
  button[1] = gpad.getButton(pair[pc][1]);  // button_B
  button[1].plug(this, "B_ButtonPress", ControlIO.ON_PRESS);
  button[1].plug(this, "B_ButtonRelease", ControlIO.ON_RELEASE);
  button[2] = gpad.getButton(pair[pc][2]);  // button_X
  button[2].plug(this, "X_ButtonPress", ControlIO.ON_PRESS);
  button[2].plug(this, "X_ButtonRelease", ControlIO.ON_RELEASE);
  button[3] = gpad.getButton(pair[pc][3]);  // button_Y
  button[3].plug(this, "Y_ButtonPress", ControlIO.ON_PRESS);
  button[3].plug(this, "Y_ButtonRelease", ControlIO.ON_RELEASE);
  button[4] = gpad.getButton(pair[pc][4]);  // button_LA
  button[4].plug(this, "LA_ButtonPress", ControlIO.ON_PRESS);
  button[4].plug(this, "LA_ButtonRelease", ControlIO.ON_RELEASE);
  button[5] = gpad.getButton(pair[pc][5]);  // button_RA
  button[5].plug(this, "RA_ButtonPress", ControlIO.ON_PRESS);
  button[5].plug(this, "RA_ButtonRelease", ControlIO.ON_RELEASE);
  button[6] = gpad.getButton(pair[pc][6]);  // button_LB
  button[6].plug(this, "LB_ButtonPress", ControlIO.ON_PRESS);
  button[6].plug(this, "LB_ButtonRelease", ControlIO.ON_RELEASE);
  button[7] = gpad.getButton(pair[pc][7]);  // button_RB
  button[7].plug(this, "RB_ButtonPress", ControlIO.ON_PRESS);
  button[7].plug(this, "RB_ButtonRelease", ControlIO.ON_RELEASE);
  button[8] = gpad.getButton(pair[pc][8]);  // button_LT
  button[8].plug(this, "LT_ButtonPress", ControlIO.ON_PRESS);
  button[8].plug(this, "LT_ButtonRelease", ControlIO.ON_RELEASE);
  button[9] = gpad.getButton(pair[pc][9]);  // button_RT
  button[9].plug(this, "RT_ButtonPress", ControlIO.ON_PRESS);
  button[9].plug(this, "RT_ButtonRelease", ControlIO.ON_RELEASE);
  button[10] = gpad.getButton(pair[pc][10]);  // button_Back
  button[10].plug(this, "Back_ButtonPress", ControlIO.ON_PRESS);
  button[10].plug(this, "Back_ButtonRelease", ControlIO.ON_RELEASE);
  button[11] = gpad.getButton(pair[pc][11]);  // button_Start
  button[11].plug(this, "Start_ButtonPress", ControlIO.ON_PRESS);
  button[11].plug(this, "Start_ButtonRelease", ControlIO.ON_RELEASE);

  hat[0] = gpad.getHat(pair[pc][12]);       // hat_XY
  hat[0].plug(this, "HatPress", ControlIO.WHILE_PRESS);
  hat[0].plug(this, "HatRelease", ControlIO.ON_RELEASE);

  if (sim) {
    king_spider = new KingSpider();
  }

 // size(600, 800); //window size
  frameRate(100); //frame rate 100Hz
  smooth(); //anti-aliasing

  if (ser) {
    //-------- List of Serial devices -----------
    printArray(Serial.list());
    String comPort = Serial.list()[serialPortNum];
    //-------------------------------------------
    myPort=new Serial(this, comPort, 57600);
    myPort.clear(); //clear buffer

    println("serial open [" + serialPortNum + "]");
    while (myPort.available()>0) {
      str=(char)myPort.read();
      println(str);
    }
  }

  speed_setting();
}

//-------------- main Loop ----------------
void draw() {
  background(0);
  textUpDate();
  switch(motionID){
    case MOTION_STOP:
    break;
    case MOTION_FORWARD:
    forward_motion_control();
    break;
    case MOTION_BACK:
    back_motion_control();
    break;
    case MOTION_LEFT:
    left_motion_control();
    break;
    case MOTION_RIGHT:
    right_motion_control();
    break;
    case MOTION_LEFTTURN:
    leftturn_motion_control();
    break;
    case MOTION_RIGHTTURN:
    rightturn_motion_control();
    break;
    case MOTION_RESET:
    initial();
    break;
    case MOTION_LLAtack:
    LeftLegAttak();
    break;
    case MOTION_SHOOT:
    shoot();
    break;
  }

  if (ser) {
    while (myPort.available()>0) {
      str=(char)myPort.read();
      print(str);
    }
  }

  delay(1);
}

void keyPressed() {
  if (key == ' ') {
    if(motionID!=MOTION_STOP && motionID!=MOTION_RESET){
      setMotion(MOTION_RESET);
    }
    setMotion(MOTION_STOP);
  } else if (key == 'i' || key == 'I') {
    initial();
  } else if (key == 'e' || key == 'E') {
    ending();
  } else if (key == 'f' || key == 'F') {
    torque=0;
    torque_setting();
  } else if (key == 'n' || key == 'N') {
    torque=1;
    torque_setting();
  } else if (key == 'c' || key == 'C') {
    speed=30;
    speed_setting();
  } else if (key == 'v' || key == 'V') {
    speed=60;
    speed_setting();
  } else if (key == 'b' || key == 'B') {
    speed=100;
    speed_setting();
  } else if (key == 'p' || key == 'P') {
    getdata();
  } else if (key == '1') {
    posture1();
  } else if (key == '2') {
    posture2();
  } else if (key == '3') {
    posture3();
  } else if (key == '4') {
    posture4();
  } else if (key == '5') {
    posture5();
  } else if (key == '6') {
    posture6();
  } else if (key == CODED) {
    if ( keyCode == SHIFT ) {
      println("shift on");
      isShiftDown = true;
    } else if ( keyCode == UP ) {
      setMotion(MOTION_FORWARD);
    } else if ( keyCode == DOWN ) {
      setMotion(MOTION_BACK);
    } else if ( keyCode == LEFT ) {
      if (isShiftDown) {
        setMotion(MOTION_LEFTTURN);
      } else {
        setMotion(MOTION_LEFT);
      }
    } else if ( keyCode == RIGHT ) {
      if (isShiftDown) {
        setMotion(MOTION_RIGHTTURN);
      } else {
        setMotion(MOTION_RIGHT);
      }
    } else {
      setMotion(MOTION_STOP);
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if ( keyCode == SHIFT ) {
      println("shift off");
      isShiftDown = false;
    }
  }
}

void textUpDate() {
  slider_LX = int(slider[0].getValue()*100);
  slider_LY = int(slider[1].getValue()*100);
  slider_RX = int(slider[2].getValue()*100);
  slider_RY = int(slider[3].getValue()*100);

  textSize(24);
  fill(240);
  textAlign(RIGHT);
  text("slider_LX U-D", 200, 40);
  text(slider_LX, 300, 40);
  
  text("slider_LY L-R", 200, 80);
  text(slider_LY, 300, 80);
  text("slider_RX U-D", 200, 120);
  text(slider_RX, 300, 120);
  
  
  
  if(mode==1){
  if(slider_LX<-80){
    setMotion(MOTION_FORWARD);
    walkrange=3;
    move=1;
  }
  else if(slider_LX<-10){ setMotion(MOTION_STOP);
  posture1();
  move=0;
  }
    if(slider_RX<-40&&slider_RY<-40){
   AtackLR=-1;
    }
  
  else if(slider_LX<-10){ setMotion(MOTION_STOP);
  AtackLR=0;
  }
  }
  
  
  
  
  text("slider_RY L-R", 200, 160);
   if(mode!=3){
  if(slider_LY<-80){
 setMotion(MOTION_LEFTTURN);
    move=1;
  }
    else if(slider_LY<-10){
  posture0();
  move=0;
    }
   if(slider_LY>80){
 setMotion(MOTION_RIGHTTURN);
    move=1;
  }
  else if(slider_LY>10){
  posture1();
  move=0;
  }
   }
   if(mode==1){

   if(slider_RY<-80){
 HeadLR-=5;
 
   onemotor_control(Head[0],HeadLR);
  }
   if(slider_RY>80){
HeadLR+=5;
  onemotor_control(Head[0],HeadLR);
  }
  
   if(slider_RX<-80){
 HeadUD-=20;
 headUD-=20;
   onemotor_control(Head[1],HeadUD);
  }
   if(slider_RX>80){
HeadUD+=20;
 headUD+=20;
  onemotor_control(Head[1],HeadUD);
   }


   }

   else if(mode==3)
 
   {
       if(slider_LY<-80){
 RightHeadLR-=5;
   onemotor_control(RightHead[0],RightHeadLR);
  }
   if(slider_LY>80){
RightHeadLR+=5;
  onemotor_control(RightHead[0],RightHeadLR);
  }
   if(slider_RY<-80){
 LeftHeadLR-=5;
   onemotor_control(LeftHead[0],LeftHeadLR);
  }
   if(slider_RY>80){
LeftHeadLR+=5;
  onemotor_control(LeftHead[0],LeftHeadLR);
  }
  
  
  if(slider_LX<-80){
 RightHeadUD-=5;
   onemotor_control(RightHead[1],RightHeadUD);
  }
   if(slider_LX>80){
RightHeadUD+=5;
  onemotor_control(RightHead[1],RightHeadUD);
  }
   if(slider_RX<-80){
 LeftHeadUD-=5;
   onemotor_control(LeftHead[1],LeftHeadUD);
  }
   if(slider_RX>80){
LeftHeadUD+=5;
  onemotor_control(LeftHead[1],LeftHeadUD);
  }


   }
   
   
   
   
  text(slider_RY, 300, 160);

  text("button_A", 200, 200);
  text(button_A, 300, 200);
  text("button_B", 200, 240);
  text(button_B, 300, 240);
  text("button_X", 200, 280);
  text(button_X, 300, 280);
  text("button_Y", 200, 320);
  text(button_Y, 300, 320);

  text("button_LA", 200, 360);
  text(button_LA, 300, 360);
  text("button_RA", 200, 400);
  text(button_RA, 300, 400);
  text("button_LB", 200, 440);
  text(button_LB, 300, 440);
  text("button_RB", 200, 480);
  text(button_RB, 300, 480);
  text("button_LT", 200, 520);
  text(button_LT, 300, 520);
  text("button_RT", 200, 560);
  text(button_RT, 300, 560);
  text("button_Back", 200, 600);
  text(button_Back, 300, 600);
  text("button_Start", 200, 640);
  text(button_Start, 300, 640);

  text("hat_XY", 200, 680);
  text(hat_XY, 300, 680);

  text("Torque:", 200, 720);
  if (torque>0) {
    text("ON", 300, 720);
  } else {
    text("OFF", 300, 720);
  }

  text("Speed:", 200, 760);
  text(speed, 300, 760);
}

//----------------  sending commands to servo -------------------
void sendCommand(String command) {
  if (ser) {
    myPort.clear(); //clear buffer
    myPort.write(command);
  }
  if (sim) {
    king_spider.writeCommand(command);
  }
}

void torque_setting() {
  if (torque == 1) {
    sendCommand("[n]\n");
  } else {
    sendCommand("[f]\n");
  }
  delay(100);
}

void speed_setting() {
  String msg = "[v," + speed + "]\n";
  sendCommand(msg);
}

void motor_control(int motorID[], int angle[]) {
  if (torque == 1) {
    String msg = "[m";
    for (int i = 0; i < motorID.length; i++) {
      msg += "," + motorID[i] + "," + angle[i];
    }
    msg += "]\n";
    sendCommand(msg);
  }
}
void onemotor_control(int motorID,int angle){
    if (torque == 1) {
    String msg = "[s";
   
      msg += "," + motorID + "," + angle;
    
    msg += "]\n";
    sendCommand(msg);
  }
}

void motion_control(int motorID[], int intervalTime[], int angle[][]) {
  int dtime = millis() - stime, t = 0, pid;
  float val, alfa = 1.4;
  for (int i = 0; i < sequence; i++) t += intervalTime[i];
  if (t < dtime) {
    if (sequence < intervalTime.length) {
      String msg = "[v";
      for (int i = 0; i < motorID.length; i++) {
        if (sequence > 0) pid = sequence - 1;
        else pid = intervalTime.length - 1;
        val = alfa * (abs((float)(angle[sequence][i] - angle[pid][i])) * 5.0 * 60.0 * 1000.0) /
          ((float)intervalTime[sequence] * 1024.0 * 3.0 * 0.111 * 2.0);
        msg += "," + motorID[i] + "," + (int)val;
      }
      msg += "]\n";
      sendCommand(msg);
      motor_control(motorID, angle[sequence]);
    }
    sequence++;
  }
}

//---------------- Button Control ------------------
void initial() {
  motionID = 0;
  sequence=0;
  if (torque == 1) {
    println("initial");
    if (speed>60) {
      speed =60;
      speed_setting();
    }
    sendCommand("[i]\n");
  }
}

void ending() {
  motionID = 0;
  if (torque == 1) {
    println("ending");
    if (speed>60) {
      speed =60;
      speed_setting();
    }
    sendCommand("[e]\n");
  }
}

//----------- Motion Buttons -----------
void setMotion(int MID){
  println(motionName[MID]);
  if(motionID!=MID){
    stime=millis();
    motionID=MID;
  }
}

//----------- Get Data Buttons -----------
void getdata() {
  sendCommand("[p]\n");
}
