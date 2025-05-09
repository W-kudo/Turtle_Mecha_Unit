int mode=1;
int RightHeadLR=1707;
int LeftHeadLR=2389;
int RightHeadUD=3072;
int LeftHeadUD=3072;
int mode3to2=0;
int AtackLR=0;
int HeadLR=2048;
int HeadUD=3072;
int NeckUD=1024;
int TailUD=2048;
int TailLR=2048;
int TnecUD=2048;
  int move=0;
  int gear=20;
  int UDgear=40;
   int moveLR=0;
  int moveUD=0;
void gearReset(){gear=20;UDgear=40;setAngle();} 
void udlrReset(){ HeadLR=2048;HeadUD=3072;NeckUD=1024;
                  TailUD=2048;TailLR=2048;TnecUD=2048;}
                  
void AllReset(){gearReset(); udlrReset();}


void A_ButtonPress() {
  
  button_A += 1;
  if (mode==1) {
   AllReset();
   posture0();
   posture1();
   onemotor_control(Tail[2],kakuhen(0));
   AllReset();
  }
  else if (mode==2) {
   AllReset();
   posture0();
   posture1();

  }
  else if (mode==3) {
    RightKick1();
    delay(100);
    postureChange3();
  }
  else if (mode==4) {
    AllReset();
    posture102();
    posture101();
  }
}


void A_ButtonRelease() {
  button_A -= 1;
}

void B_ButtonPress() {
  button_B += 1;
  if (mode!=3) {
    if (AtackLR==-1) {
      speed =600;
      speed_setting();
      LHA();
      delay(1000);
      speed =200;
      speed_setting();
      posture0();
    }
    AllReset();
  } else if (mode==3) {
    RightKick1();
    delay(1000);
    RightKick2();
    delay(500);
    postureChange3();
  }
}

void B_ButtonRelease() {
  button_B -= 1;
}

void X_ButtonPress() {
  button_X += 1;
  if(mode==1){
    if(button_LA==1){
      if(moveUD!=0){
        if(abs(TailUD)<kakuhen(90))
        TailUD=TailUD+moveUD*kakuhen(30);
        onemotor_control(Tail[0],TailUD);
      }
      else if(moveLR!=0){
        if (abs(TailLR)<kakuhen(90))
        TailLR=TailLR+moveLR*kakuhen(30);
         onemotor_control(Tail[1],TailLR);
      }
      else  {
        TnecUD=(TnecUD+1024)%3072+1024;
         onemotor_control(Tail[2],TnecUD);
      }
      }
   else if(button_LA==0){
    if(moveUD!=0){
      if (abs( HeadUD)<kakuhen(90))
        HeadUD= HeadUD+moveUD*kakuhen(30);
        onemotor_control( Head[0], HeadUD);
      }
      else if(moveLR!=0){
        if(abs( HeadLR)<kakuhen(90))
        HeadLR= HeadLR+moveLR*kakuhen(30);
         onemotor_control( Head[1], HeadLR);
      }
      else  {
        NeckUD=(NeckUD+1024)%3072+1024;
         onemotor_control(Head[2],NeckUD);
      }
     }
    }
   
  
  else if (mode==3) {

    setMotion(MOTION_SHOOT);
  }
}

void X_ButtonRelease() {
  button_X -= 1;
  if (mode==3) {
    setMotion(MOTION_STOP);
    postureChange3();
  }
}

void Y_ButtonPress() {
  button_Y += 1;
  if (mode!=3) {
    if (mode==2) {
      if (LR==1)head=(head+1)%6;
      else if (LR==-1)head=(head+4)%6;
      mode3to2=1;
    }
    RightHeadLR=1707;
    LeftHeadLR=2389;
    RightHeadUD=3072;
    LeftHeadUD=3072;
    posture0();
    delay(100);
    postureChange1();
    delay(200);
    postureChange2();
    delay(100);
    postureChange3();
    mode=3;
  } else if (mode==3)
  { 
    postureChange2();
    delay(800);
    postureChange1();
    delay(200);
    posture0();
    if (mode3to2==1) {
      mode3to2=0;
      if (LR==1) head=(head+5)%6;
      else if (LR==-1)head=(head+2)%6;
    }
    mode=1;
  }


  // posture4();
}

void Y_ButtonRelease() {
  button_Y -= 1;
}

void LA_ButtonPress() {
  button_LA += 1;
  if(mode==1){
     onemotor_control(Tail[2],kakuhen(0));
     AllReset();
    mode=4;
    speed=60;
    posture101();
  }
  else if(mode==4){
    mode=1;
    speed=60;
    posture0();
  }
 // initial();
}

void LA_ButtonRelease() {
  button_LA -= 1;
}

void RA_ButtonPress() {
  button_RA += 1;
  ending();
}

void RA_ButtonRelease() {
  button_RA -= 1;
}

void LB_ButtonPress() {

  button_LB += 1;
  /* speed = speed - 20;
   if (speed < 20) speed = 20;
   speed_setting();*/
  if (mode!=3) {
    if( button_LT==1){
       if(UDgear>40)
                   UDgear-=30;
                   setAngle();
                        }
    else if( button_RT==1){
      if(gear>20) 
          gear-=20;
          setAngle();
        }
   else{
    speed = 200;
    speed_setting();
    posture0();
    head++;
    if (head>5)head-=6;
    if (move==0)posture1();
        }
  }
}

void LB_ButtonRelease() {

  button_LB -= 1;
}

void RB_ButtonPress() {
  button_RB = 1;
  /* speed = speed + 20;
   if (speed > 200)*/
  if (mode!=3) {
    
     if( button_LT==1){
       if(UDgear<100)
                   UDgear+=30;
                   setAngle();
                        }
    else if( button_RT==1){
      if(gear<60) 
          gear+=20;
          setAngle();
        }
   else{ 
    speed = 200;
    speed_setting();
    posture0();
    head--;
   
    if (head<0)head+=6;
    if (move==0)posture1();
    }
  }
  //if(mode==2)
}

void RB_ButtonRelease() {

  button_RB = 0;
}

void LT_ButtonPress() {

  button_LT += 1;

}

void LT_ButtonRelease() {
  button_LT -= 1;
}

void RT_ButtonPress() {
  button_RT += 1;
  if (button_LT == 1) {
    speed = 200;
    speed_setting();
    posture0();
  }
  //posture6();
}

void RT_ButtonRelease() {
  button_RT -= 1;
}

void Back_ButtonPress() {
  button_Back += 1;
  walkUPside*=-1;
}

void Back_ButtonRelease() {
  button_Back -= 1;
}

void Start_ButtonPress() {
  button_Start += 1;
  if (torque == 1) torque = 0;
  else torque = 1;
  torque_setting();
  reboot();
}

void Start_ButtonRelease() {
  button_Start -= 1;
}
int LR=0;
void HatPress(float x, float y) {
            hat_XY = (int)hat[0].getValue();
            move=1;
            if (hat_XY == 2) {
                              if (mode==1) {
                                  setMotion(MOTION_FORWARD);
                              }
                              else if (mode==2) {
                                   mode=1;
                                   AllReset();
                                   setMotion(MOTION_FORWARD);
                              }
                              else if (mode==3) {
                              }
                              else if (mode==4) {
                                setMotion(MOTION_FORWARD);
                              }
            } else if (hat_XY == 6) {
                              if (mode==1) {
                                
                                          setMotion(MOTION_BACK);
                                          
                              } else if (mode==2) {
                              mode=1;
                               AllReset();
      setMotion(MOTION_BACK);
    }
  } else if (hat_XY == 8) {
    if (mode!=3) {
      if (mode==1){
      mode=2;gearReset();
      gear=20;
      UDgear=40;
    }
      LR=1;
      setMotion(MOTION_LEFT);
    }
  } else if (hat_XY == 4) {
    if (mode!=3) {
      if (mode==1){
        mode=2;gearReset();
      gear=20;
      UDgear=40;
    }
      LR=-1;
      setMotion(MOTION_RIGHT);
    }
  }
}

void HatRelease(float x, float y) {

  hat_XY = (int)hat[0].getValue();
  move=0;
  if (mode==1) {
    posture1();
    if (hat_XY == 0) setMotion(MOTION_STOP);
  }
  else if(mode==2){
    head=(head+1)%6;
 
    posture20();
    head=(head+5)%6;
    if (hat_XY == 0) setMotion(MOTION_STOP);
  }
  else if(mode==3){
  }
  else if(mode==4){
    posture101();
    if (hat_XY == 0) setMotion(MOTION_STOP);
  }
}
