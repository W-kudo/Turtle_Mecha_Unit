//----- the motorIDs, angular values, interval times must be defined by the user ------

////////////////////歩く用の脚の動き///////////////////

  
  int[][] LeftLegAtack={
    {
      2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  3072  ,  1024  ,  2048  ,  2560  ,  2048                          

    },
    {
      2048  ,  1024  ,  2048  ,  2048  ,  2048  ,  2276  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  3072  ,  1024  ,  2048  ,  2560  ,  2048                          

    }
  };
  
  int kakuhen(int degree){
    float data=0;
    data=2048*(1+(float)degree/180);
    return (int)data;
  }

  
  //gear:歩幅(20,40,60)　//UDgear:足を上げる高さ(40,70,100)
   int[][] angle0 = {
{
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,  
      2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) ,
      2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(-3*UDgear/5) ,  TailUD  ,  2048  //尻尾を右にする                        
  },//右足を上げる
    {
      kakuhen(gear)  ,  1024  ,  2048  ,  kakuhen(-gear) ,  1024  ,  2048  ,
     kakuhen(-gear)  ,  1024  ,  2048  , kakuhen(gear) ,  1024  ,  2048  , 
      2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(-3*UDgear/5)  ,  TailUD  ,  2048                          
  },//右足を前におろす
    {
     2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,
     2048  ,  HeadUD ,  NeckUD  ,  kakuhen(3*UDgear/5) ,  TailUD  ,  2048//尻尾を左にする                          
  },//左脚を上げる,右足を後ろにする
    {
     kakuhen(-gear) ,  1024  ,  2048  ,  kakuhen(gear)  ,  1024  ,  2048  , 
     kakuhen(gear)  ,  1024  ,  2048  ,   kakuhen(-gear) ,  1024  ,  2048  , 
     2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(3*UDgear/5),  TailUD  ,  2048                          
    }//左足をおろす
  }; // posture3

  
   int[][] LRangle = {
 {
           kakuhen(60+0)  ,      kakuhen(-90+UDgear) ,      kakuhen(-UDgear)  ,       kakuhen(60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40) ,
           kakuhen(-60+gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(-60+gear)  ,  kakuhen(-90+UDgear) ,       kakuhen(-UDgear)  , 
           kakuhen(0-gear)  ,    kakuhen(-90+UDgear) ,      kakuhen(-UDgear)        , kakuhen(0+0)  ,       kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,                          

  },//右足を上げる
    {
           kakuhen(60+0)  ,      kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(60+0)  ,       kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(-60+gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(-60+gear)  ,   kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(0-gear)  ,    kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(0+0) ,         kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)                          

  },//右足を前におろす
    {
           kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(60-gear)  ,    kakuhen(-90+UDgear) ,       kakuhen(-UDgear)  , 
           kakuhen(-60+0)  ,    kakuhen(-90+UDgear) ,      kakuhen(-UDgear)  ,       kakuhen(-60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  ,      kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0+gear)  ,     kakuhen(-90+UDgear) ,       kakuhen(-UDgear)                          

  },//左脚を上げる,右足を後ろにする
    {
          kakuhen(60-gear)  ,   kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(60-gear)  ,    kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
          kakuhen(-60+0)  ,     kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(-60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
          kakuhen(0-0)  ,       kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0+gear)  ,     kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)                          
    }//左足をおろす
  }; // posture3
  
  
  
  
   int[][] RTurnAngle = {
   {
      2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707  ,  2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707                          

  },//右足を上げる
    {
      2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048                          

  },//右足を前におろす
    {
      2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707  ,  2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048                          

  },//左脚を上げる,右足を後ろにする
    {
      2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048                          
    }//左足をおろす
  }; // posture3
  int[][] LTurnAngle = {
  
   
    {
      2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048                          
    },//左足をおろす
      {
      2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707  ,  2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048                          

  },//右足を前におろす
     {
      2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1024  ,  2048                          

  },//左脚を上げる,右足を後ろにする
    {
      2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707  ,  2389  ,  1365  ,  1707  ,  2048  ,  1024  ,  2048  ,  2048  ,  1024  ,  2048  ,  2389  ,  1365  ,  1707                          

  }//右足を上げる
  }; // posture3

  int[][]shootAngle={
    {
          2048  ,  1024  ,  2048  ,  LeftHeadLR  ,  3072  ,  1024  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  , 3072  ,  1024  ,  2048  ,  1024  ,  2048
    },
        {
          2048  ,  1024  ,  2048  , LeftHeadLR ,  1024  , 1024  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  ,  1024  ,  1024  ,  2048  ,  1024  ,  2048                          
    },
{
          2048  ,  1024  ,  2048  ,  LeftHeadLR  ,   2000  ,  2048 ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR  ,  2000  ,  2048  ,  2048  ,  1024  ,  2048                          
    },
    {
          2048  ,  1024  ,  2048  ,  LeftHeadLR-10  ,  2389  ,  1024  ,  1365  ,  1024  ,  2048  ,  2731  ,  1024  ,  2048  ,  RightHeadLR+10  , 2389  ,  1024  ,  2048  ,  1024  ,  2048
    },
  };
  
int head=0;
int[] RightHead={13,14,15},LeftHead={4,5,6};

int[] Head={13,14,15},LeftHand={4,5,6},RightHand={7,8,9},LeftLeg={10,11,12},RightLeg={7,8,9},Tail={16,17,18};


void setAngle(){
  
   int _angle0[][] = {
             {
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,  
      
      2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 
      
      2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(-3*UDgear/5) ,  TailUD  ,  2048  //尻尾を右にする                        
  },//右足を上げる
  
    {
      kakuhen(gear)  ,  1024  ,  2048  ,  kakuhen(-gear) ,  1024  ,  2048  ,
     kakuhen(-gear)  ,  1024  ,  2048  , kakuhen(gear) ,  1024  ,  2048  , 
      2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(-3*UDgear/5)  ,  TailUD  ,  2048                          
  },//右足を前におろす
  
  
    {
     2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 
     
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,
      
     2048  ,  HeadUD ,  NeckUD  ,  kakuhen(3*UDgear/5) ,  TailUD  ,  2048//尻尾を左にする                          
  },//左脚を上げる,右足を後ろにする
  
  
    {
     kakuhen(-gear) ,  1024  ,  2048  ,  kakuhen(gear)  ,  1024  ,  2048  , 
     kakuhen(gear)  ,  1024  ,  2048  ,   kakuhen(-gear) ,  1024  ,  2048  , 
     2048  ,  HeadUD  ,  NeckUD  ,  kakuhen(3*UDgear/5),  TailUD  ,  2048                          
    }//左足をおろす
  }; // posture3
    
   int[][] _LRangle = {
   {
           kakuhen(60+0)  ,      kakuhen(-90+UDgear) ,      kakuhen(-UDgear)  ,       kakuhen(60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40) ,
           kakuhen(-60+gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(-60+gear)  ,  kakuhen(-90+UDgear) ,       kakuhen(-UDgear)  , 
           kakuhen(0-gear)  ,    kakuhen(-90+UDgear) ,      kakuhen(-UDgear)        , kakuhen(0+0)  ,       kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,                          

  },//右足を上げる
    {
           kakuhen(60+0)  ,      kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(60+0)  ,       kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(-60+gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(-60+gear)  ,   kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(0-gear)  ,    kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(0+0) ,         kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)                          

  },//右足を前におろす
    {
           kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(60-gear)  ,    kakuhen(-90+UDgear) ,       kakuhen(-UDgear)  , 
           kakuhen(-60+0)  ,    kakuhen(-90+UDgear) ,      kakuhen(-UDgear)  ,       kakuhen(-60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  ,      kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0+gear)  ,     kakuhen(-90+UDgear) ,       kakuhen(-UDgear)                          

  },//左脚を上げる,右足を後ろにする
    {
          kakuhen(60-gear)  ,   kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(60-gear)  ,    kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
          kakuhen(-60+0)  ,     kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(-60+0)  ,      kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)  ,
          kakuhen(0-0)  ,       kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0+gear)  ,     kakuhen(-90+UDgear-40) ,    kakuhen(-UDgear+40)                          
    }//左足をおろす
  }; // posture3

  
  angle0=_angle0;
  LRangle=_LRangle;
}

void setMotorID(int[] motorID,int vector){
  int[][] tmp={{13,14,15},{4,5,6},{10,11,12},{16,17,18},{1,2,3},{7,8,9}};
  int c=(4+head+vector)%6;
  for(int i=0;i<6;i++){
    for(int j=0;j<3;j++){
  motorID[i*3+j]=tmp[c][j];
  println(i,c,j,head);
  
    }
  if((c+3+i%2)%6<=6)  c=(c+3+i%2)%6;
  }
 for(int k=0;k<3;k++){
   RightHead[k]=tmp[head][k];
   LeftHead[k]=tmp[(head+1)%6][k];
   
   Head[k]=tmp[head][k];
   LeftHand[k]=tmp[(head+1)%6][k];
   LeftLeg[k]=tmp[(head+2)%6][k];
   Tail[k]=tmp[(head+3)%6][k];
   RightLeg[k]=tmp[(head+4)%6][k];
   RightHand[k]=tmp[(head+5)%6][k];
 }
}


    int walkrange=0;
    int walkUPside=1;
      int[] intervalTime = {300, 200, 300,200}; // Interval Time [ms] for each posture
      int[] intervalTime_D = {400, 300, 400,300}; // Interval Time [ms] for each posture


  
   int[][]AllmotorID ={
   {1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18},//前
   {7,8,9     , 10,11,12,            13, 14, 15,       16,17,18,    4,5,6,          1, 2, 3},//左前
   {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12},//右前
    { 4, 5, 6,         1, 2, 3,        10, 11, 12,     7, 8, 9,          16, 17, 18,         13, 14, 15},//後
   };
   int[][]Dinosaur_F_motion={
        { //////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),  kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },     
      
      {///////////////////左足をあげる
        kakuhen(  60),  kakuhen(   20),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -60),  kakuhen(   0),          kakuhen( -60),  kakuhen( -80),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(  50),  kakuhen( 0),          kakuhen(  20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    },
    
        { /////////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },  
      {////////////////右足を上げる
        kakuhen(  60),  kakuhen( -80),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -60),  kakuhen(   0),/////////右足////////////左手
        kakuhen(   90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   20),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen( -20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    }
  };
     int[][]Dinosaur_L_motion={
        { //////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),  kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },     
      
      {///////////////////左足をあげる
        kakuhen(  60),  kakuhen(   20),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -60),  kakuhen(   0),          kakuhen( -60),  kakuhen( -80),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(  50),  kakuhen( 0),          kakuhen(  20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    },
            { //////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),  kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },     
      
      {///////////////////左足をあげる
        kakuhen(  60),  kakuhen(   20),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -60),  kakuhen(   0),          kakuhen( -60),  kakuhen( -80),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(  50),  kakuhen( 0),          kakuhen(  20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    }
  };
     int[][]Dinosaur_R_motion={    
        { /////////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },  
      {////////////////右足を上げる
        kakuhen(  60),  kakuhen( -80),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -60),  kakuhen(   0),/////////右足////////////左手
        kakuhen(   90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   20),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen( -20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    },
            { /////////////////初期姿勢
          kakuhen(  60),  kakuhen(   0),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -20),  kakuhen(   0),/////////右足////////////左手
        kakuhen(  90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   0),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen(   0),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾
      },  
      {////////////////右足を上げる
        kakuhen(  60),  kakuhen( -80),  kakuhen( -90),          kakuhen( -90),  kakuhen(  -60),  kakuhen(   0),/////////右足////////////左手
        kakuhen(   90),  kakuhen(  -20),  kakuhen(   0),          kakuhen( -60),  kakuhen(   20),  kakuhen( -90),/////////////右手///////左足
        kakuhen(   0),   kakuhen(   50),  kakuhen( 0),          kakuhen( -20),  kakuhen(  70),  kakuhen(  30) ///////////頭////////尻尾                  
    }
  };
  
  
  
  
void forward_motion_control() {
  setAngle();
  int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
  setMotorID(motorID,0);
 if(mode==1){
    motion_control(motorID, intervalTime, angle0);
 }
 else if(mode==4){
    motion_control(motorID, intervalTime, Dinosaur_F_motion);
 }

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void back_motion_control() {
int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              { 4, 5, 6,         1, 2, 3,        10, 11, 12,     7, 8, 9,          16, 17, 18,         13, 14, 15};
  setMotorID(motorID,3);  
motion_control(motorID, intervalTime, angle0);

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void left_motion_control() {
 
 if(mode==1){
    int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {7,8,9     , 10,11,12,            13, 14, 15,       16,17,18,    4,5,6,          1, 2, 3};
 setMotorID(motorID,0); 
    motion_control(motorID, intervalTime, angle0);
 }
 else if(mode==4){
     int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
  setMotorID(motorID,0);
    motion_control(motorID, intervalTime_D, Dinosaur_L_motion);
 }
  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void right_motion_control() {
  
 if(mode==1){
     int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12};
  setMotorID(motorID,3);
    motion_control(motorID, intervalTime, angle0);
 }
 else if(mode==4){
     int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
  setMotorID(motorID,0);
    motion_control(motorID, intervalTime_D, Dinosaur_R_motion);
 }

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void leftturn_motion_control() {
  int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12};
  setMotorID(motorID,0);  
 motion_control(motorID, intervalTime, LTurnAngle);

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void rightturn_motion_control() {
   int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12};
  setMotorID(motorID,0);  
 motion_control(motorID, intervalTime, RTurnAngle);

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}
void LeftLegAttak(){
    int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
    setMotorID(motorID,0);  
  int[]  AtackIntervalTime={200,100};
  motion_control(motorID, AtackIntervalTime, LeftLegAtack);
  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}
void shoot(){
    int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
    setMotorID(motorID,0);  
  int[]  shootTime={1000,500,100,300};
  motion_control(motorID, shootTime, shootAngle);
  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}
