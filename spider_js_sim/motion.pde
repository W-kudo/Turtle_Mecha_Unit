//----- the motorIDs, angular values, interval times must be defined by the user ------

////////////////////歩く用の脚の動き///////////////////
  int[][] angleorigin = {
    //{2048, 1024, 2048, 2048, 1027, 2049, 2048, 1024, 2048, 2048, 1023, 2048, 2048, 3059, 1024, 2048, 2038, 2048}, // posture1
    ///////右後ろあし////////////左まえ脚///////////////////右前あし/////////////左うしろ脚//////////////頭///////////////////尻尾
    {
    2063, 1013, 2045,     2069, 1035, 2061,        1439, 1559, 1679,      2184, 1441, 1619,        2048, 3058, 1064,        2505, 3213,1000
  },//右足を上げる
    {
    2066, 1041, 2033,     1932, 1031, 2106,        1176, 1065, 1956,      3037, 1044, 2029,        2048, 3054, 900,        2555,3213,1000
  },//右足を前におろす
    {
    2258,1589,1428,       2258,1529,1474,          1826,1001,2039,        2108,1106,2002,          2048,3057,900,          1517,3213,1000
  },//左脚を上げる,右足を後ろにする
    {
    1105,1094,1929,       2470,1079,2045,          1767,986,1938,         1966,1018,2040,          2048,3057,1064,          1517,3213,1000
    }//左足をおろす
  }; 
  
  
  int move=0;

  
  
  
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
      
      2048  ,  HeadUD  ,  1024  ,  kakuhen(-20) ,  TailUD  ,  2048  //尻尾を右にする                        
  },//右足を上げる
  
    {
      kakuhen(gear)  ,  1024  ,  2048  ,  kakuhen(-gear) ,  1024  ,  2048  ,
     kakuhen(-gear)  ,  1024  ,  2048  , kakuhen(gear) ,  1024  ,  2048  , 
      2048  ,  HeadUD  ,  1024  ,  kakuhen(-20)  ,  TailUD  ,  2048                          
  },//右足を前におろす
  
  
    {
     2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 
     
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,
      
     2048  ,  HeadUD ,  1024  ,  kakuhen(20) ,  TailUD  ,  2048//尻尾を左にする                          
  },//左脚を上げる,右足を後ろにする
  
  
    {
     kakuhen(-gear) ,  1024  ,  2048  ,  kakuhen(gear)  ,  1024  ,  2048  , 
     kakuhen(gear)  ,  1024  ,  2048  ,   kakuhen(-gear) ,  1024  ,  2048  , 
     2048  ,  HeadUD  ,  1024  ,  kakuhen(20),  TailUD  ,  2048                          
    }//左足をおろす
  }; // posture3

  

  
  
  
   
   int[][] angle00 = {
    {
      2276  ,  3072  ,  2048  ,  1820  ,  3072  ,  2048  ,  2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,  2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048                          
  },//右足を上げる
    {
      2276  ,  3072  ,  2048  ,  1820  ,  3072  ,  2048  ,  1820  ,  3072  ,  2048  ,  2276  ,  3072  ,  2048  ,  2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048                          
  },//右足を前におろす
    {
      2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,  2276  ,  3072  ,  2048  ,  1820  ,  3072  ,  2048  ,  2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048                          
  },//左脚を上げる,右足を後ろにする
    {
      1820  ,  3072  ,  2048  ,  2276  ,  3072  ,  2048  ,  2276  ,  3072  ,  2048  ,  1820  ,  3072  ,  2048  ,  2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048                          
    }//左足をおろす
  }; // posture3
  
  
   int[][] angle11 = {
   {
      2503  ,  3072  ,  2048  ,  1593  ,  3072  ,  2048  ,  2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,
2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を上げる
    {
      2503  ,  3072  ,  2048  ,  1593  ,  3072  ,  2048  ,  1593  ,  3072  ,  2048  ,  2503  ,  3072  ,  2048  ,
2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を前におろす
    {
      2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,  2503  ,  3072  ,  2048  ,  1593  ,  3072  ,  2048  , 
2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048
  },//左脚を上げる,右足を後ろにする
    {
      1593  ,  3072  ,  2048  ,  2503  ,  3072  ,  2048  ,  2503  ,  3072  ,  2048  ,  1593  ,  3072  ,  2048  , 2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048
    }//左足をおろす
  }; // posture3
  
   int[][] angle22 = {
    {
      2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を上げる
  
    {
      2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を前におろす
  
    {
      2048  ,  2617  ,  2503  ,  2048  ,  2617  ,  2503  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048
    },

    {
      1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,2048  ,  1024  ,  3072  ,  1820  ,  1536  ,  2048

    }//左足をおろす
  }; // posture3
  
     int[][] angle33 = {
    {
      2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  2048  ,  2162  ,  2958  ,  2048  ,  2162  ,  2958  ,
2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を上げる
    {
      2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  , 
2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を前におろす
    {
      2048  ,  2162  ,  2958  ,  2048  ,  2162  ,  2958  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  , 
      2048  ,  3072  ,  1024  ,  1820  ,  2560  ,  2048                          
  },//左脚を上げる,右足を後ろにする
    {
      1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,
      2048  ,  3072  ,  1024  ,  1820  ,  2560  ,  2048                          
    }//左足をおろす
  }; // posture3
     int[][] angle4 = {
    {
  2734,1018,2046,2680,983,2021,1397,1041,1970,1361,1042,2006,2042,3057,1025,2046,1234,2048
  },//右足を上げる
    {
      2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  , 
2048  ,  1024  ,  3072  ,  2276  ,  1536  ,  2048
  },//右足を前におろす
    {
      2048  ,  2162  ,  2958  ,  2048  ,  2162  ,  2958  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  , 
      2048  ,  3072  ,  1024  ,  1820  ,  2560  ,  2048                          
  },//左脚を上げる,右足を後ろにする
    {
      1365  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  2731  ,  3072  ,  2048  ,  1365  ,  3072  ,  2048  ,
      2048  ,  3072  ,  1024  ,  1820  ,  2560  ,  2048                          
    }//左足をおろす
  }; // posture3
  
  
  
   int[][] LRangle = {
   {
           kakuhen(60+0)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  ,   kakuhen(60+0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40) ,
           kakuhen(0-0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0-0)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  , 
          kakuhen(0-gear)  ,   kakuhen(-90+UDgear) ,   kakuhen(-UDgear)        ,  kakuhen(0+0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,                          

  },//右足を上げる
    {
           kakuhen(60+0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(60+0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,  kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(0+0) , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)                          

  },//右足を前におろす
    {
           kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60-gear)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  , 
           kakuhen(0-60)  ,   kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  ,  kakuhen(0-60)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(0+gear)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)                          

  },//左脚を上げる,右足を後ろにする
    {
          kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60-gear)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
          kakuhen(0-gear)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(0-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
          kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,  kakuhen(0+gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)                          
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
      
      2048  ,  HeadUD  ,  1024  ,  kakuhen(-20) ,  TailUD  ,  2048  //尻尾を右にする                        
  },//右足を上げる
  
    {
      kakuhen(gear)  ,  1024  ,  2048  ,  kakuhen(-gear) ,  1024  ,  2048  ,
     kakuhen(-gear)  ,  1024  ,  2048  , kakuhen(gear) ,  1024  ,  2048  , 
      2048  ,  HeadUD  ,  1024  ,  kakuhen(-20)  ,  TailUD  ,  2048                          
  },//右足を前におろす
  
  
    {
     2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 2048  ,  kakuhen(-90+UDgear)  ,   kakuhen(-1*UDgear) , 
     
      kakuhen(gear) ,  1024  ,  2048  ,   kakuhen(-gear)  ,  1024  ,  2048  ,
      
     2048  ,  HeadUD ,  1024  ,  kakuhen(20) ,  TailUD  ,  2048//尻尾を左にする                          
  },//左脚を上げる,右足を後ろにする
  
  
    {
     kakuhen(-gear) ,  1024  ,  2048  ,  kakuhen(gear)  ,  1024  ,  2048  , 
     kakuhen(gear)  ,  1024  ,  2048  ,   kakuhen(-gear) ,  1024  ,  2048  , 
     2048  ,  HeadUD  ,  1024  ,  kakuhen(20),  TailUD  ,  2048                          
    }//左足をおろす
  }; // posture3
    
   int[][] _LRangle = {
   {
           kakuhen(60+0)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  ,   kakuhen(60+0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40) ,
           kakuhen(0-0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,    kakuhen(0-0)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  , 
          kakuhen(0-gear)  ,   kakuhen(-90+UDgear) ,   kakuhen(-UDgear)        ,  kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,                          

  },//右足を上げる
    {
           kakuhen(60+0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,   kakuhen(60+0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,  kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60-gear) , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)                          

  },//右足を前におろす
    {
           kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60-gear)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  , 
           kakuhen(0-60)  ,   kakuhen(-90+UDgear) ,   kakuhen(-UDgear)  ,  kakuhen(0-60)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
           kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60+0)  ,  kakuhen(-90+UDgear) ,   kakuhen(-UDgear)                          

  },//左脚を上げる,右足を後ろにする
    {
          kakuhen(60-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(60-gear)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
          kakuhen(0-gear)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  , kakuhen(0-gear)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,
          kakuhen(0-0)  , kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)  ,  kakuhen(60+0)  ,  kakuhen(-90+UDgear-40) ,   kakuhen(-UDgear+40)                          
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


  
   int[][]AllmotorID ={
   {1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18},//前
   {7,8,9     , 10,11,12,            13, 14, 15,       16,17,18,    4,5,6,          1, 2, 3},//左前
   {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12},//右前
    { 4, 5, 6,         1, 2, 3,        10, 11, 12,     7, 8, 9,          16, 17, 18,         13, 14, 15},//後
   };
  
  
  
  
  
void forward_motion_control() {
  setAngle();
  int[] motorID ={1, 2, 3,     4, 5, 6,     7, 8, 9,         10, 11, 12,         13, 14, 15,           16, 17, 18};
  setMotorID(motorID,0);
  
  int[] intervalTime1 = {300,100,300, 300,100, 300}; 
  gear=Gear;
  UDgear=UDGear;
  println(gear);
   // motion_control(motorID, intervalTime1, angleX);
motion_control(motorID, intervalTime, angle0);


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
 int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {7,8,9     , 10,11,12,            13, 14, 15,       16,17,18,    4,5,6,          1, 2, 3};
 setMotorID(motorID,0);  
motion_control(motorID, intervalTime, LRangle);

  if (sequence > intervalTime.length) {
    sequence = 0;
    stime = millis();
  }
}

void right_motion_control() {
  int[] motorID = //{1, 2, 3,      4, 5, 6,          7, 8, 9,          10, 11, 12,     13, 14, 15,          16, 17, 18};
              {13,14,15     , 16,17,18,            1, 2, 3,       4,5,6,    7,8,9,          10,11,12};
  setMotorID(motorID,3);  
 motion_control(motorID, intervalTime, LRangle);

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
