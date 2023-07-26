//----------- Posture Buttons -----------
//the motorIDs and angular values must be defined by the user according to robot's body structure.
void posture1() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  3072  ,  1024  ,  2048  ,  2048  ,  3072                          
};


  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture1");
}

void posture0() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048 ,  2048  ,  1024  ,  2048                       
};


  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture1");
}

void posture20() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048 ,  2048  ,  1024  ,  2048                       
};


  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture1");
}
void posture11() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {
      2048  ,  3072  ,  2048  ,  2048  ,   3072  ,  2048  ,  2048  ,   3072  ,  2048  ,  2048  ,   3072  ,  2048  ,  2048  ,  1024  , 3072  ,  2048  ,  2048  ,  3072                          
};


  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture1");
}

void posture2() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {2063,1013,2045,2069,1035,2061,1439,1559,1679,2184,1421,1619,2048,3058,1024,2005,2251,2049};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture2");
}

void posture3() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {2066,1041,2033,1932,1031,2106,1176,1065,1956,3037,1044,2029,2048,3054,1023,2061,2156,2544}; // posture3

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture3");
}

void posture4() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {2258,1589,1428,2258,1529,1474,1826,1001,2039,2108,1106,2002,2048,3057,1017,2032,2485,2158};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}

void posture5() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
    setMotorID(motorID,0);
  int[] angle = {1105,1094,1929,2470,1079,2045,1767,986,1938,1966,1018,2040,2048,3057,1017,1642,2463,2000};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture5");
}

void posture6() {
  int[] motorID = {13, 15, 17};
  int[] angle = {512, 400, 600};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture6");
}
void postureChange1() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  1365  ,  1479  ,  1593  ,  2731  ,  1479  ,  1593  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void postureChange2() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void postureChange3() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  LeftHeadLR  ,  3072  ,  1024  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  , 3072  ,  1024  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void RightKick1() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  , LeftHeadLR ,  1024  ,  2000  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  ,  1024  ,  2000  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void RightKick2() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  LeftHeadLR  ,   2389  ,  2048 ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  ,  2389  ,  2048  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void LeftKick1() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  , LeftHeadLR ,  1024  ,  1024  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,   RightHeadLR  ,  1024  ,  1024  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void LeftKick2() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  , LeftHeadLR ,  2389  ,  2048  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  , RightHeadLR  ,  2389  ,  2048  ,  2048  ,  1024  ,  2048                          
};

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
void LHA() {
  int[] motorID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
   setMotorID(motorID,0);
  int[] angle = {
      2048  ,  1024  ,  2048  ,  2048  ,  2048  ,  2276  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048                          
    };

  motionID = 0;
  speed_setting();
  motor_control(motorID, angle);
  println("posture4");
}
