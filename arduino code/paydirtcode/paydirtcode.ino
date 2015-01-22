#include <LiquidCrystal.h>
#include <TimeAlarms.h>
#include<String.h>
#include <EEPROM.h>
#include <Wire.h>
#include <Time.h>
#include <DS1307RTC.h>
LiquidCrystal lcd(12,4,6,5,8,3,7);
//the numbers display number of childs of the element
String menu[]={"Alarm","2","Set","2","fn0Morning","0","fn0Evening","0","Delete","2","fn1Morning","0","fn1Evening","0","Level","3","depth","0","low","0","high","0","Time And Date","2","settTime","0","setdDate","0","resetDefault","0"};
int count=0;
int buttonDay,buttonHour,buttonMinute,buttonSecond;
boolean menuopen = false;
boolean workdone = false;
const int relPin = 2;
const int trigPin = A3;
const int echoPin = A2;
const int left = 10 ; //left or up
const int right = 11 ; //right or down
const int enter = 9 ; //enter or escape on long press
long durationUS = 0;
int cm=0;
int leftVal,rightVal,enterVal;
int cpos=0,pos=0,nback=0,ppos=0;
int backel[3] = {-1,-1,-1};
void setup()
{
  
  lcd.begin(16,2);
  lcd.clear();
  while(menu[count]!=NULL)
{
  count++;
}
  //Serial.begin(9600);
  //while(!Serial)
  delay(100);
  pinMode(relPin, OUTPUT);
  pinMode(left, INPUT);
  pinMode(right, INPUT);
  pinMode(enter, INPUT);
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  lcd.setCursor(0,0);
  lcd.print("PayDirt Solutions");
  //Serial.print("Paydirt Solution");
  //Serial.print("Press Enter key to go to Main Menu");
  //Serial.println();
}
void loop()
{
  tmElements_t tm; 
    if (RTC.read(tm)) {
      if(tm.Second%5==0)
      {
     checkActivity();
      }
    }
  int hr1=EEPROM.read(3);
  int mn1=EEPROM.read(4);
  int sec1=EEPROM.read(5);
  int hr2=EEPROM.read(6);
  int mn2=EEPROM.read(7);
  int sec2=EEPROM.read(8);
  if(hr1!=0){Alarm.alarmRepeat(hr1,mn1,sec1, motorTriggeron);}
  if(hr2!=0){Alarm.alarmRepeat(hr2,mn2,sec2, motorTriggeron);}
  if(menuopen!=true){
  rootscreen();}
  leftVal = digitalRead(left);
  rightVal = digitalRead(right);
  
  int eVal = readEnter();
  if(menuopen==false && eVal==1){
 
    recordTime();
    displayLCD(0);
    menuopen=true;
    eVal=0;
    delay(200);
  }
  if(menuopen==true){
    int limit =0;
  if(rightVal==HIGH)
  {
    recordTime();
    int newpos=0;
     ppos = cpos;
     if(cpos>=count-2)
     {
       newpos=cpos;
       newpos++;
     }
     else
     {   
       newpos = locateNext(cpos);
       nback++;
       backel[nback-1] = ppos;
     }
     cpos=newpos-1;
     //Serial.print(menu[cpos]);
     displayLCD(cpos);
     delay(200);
     rightVal=LOW;
     //Serial.println();
  }
  else if(eVal==1)
  {
    recordTime();
    //nback = 0;
    int newpos=0;
    
     newpos = locateEnter(cpos);
     if(newpos==-1){
         enterVal=LOW;
         functionALL(menu[cpos]);
         //Serial.println();
     }
     else{
     
     cpos = newpos;

     displayLCD(cpos);
     eVal=0;
     //Serial.print(menu[cpos]);
     //Serial.println();
   }
     delay(200);
  }
  else if(leftVal==HIGH){
    recordTime();
    int newpos = 0;
    
    newpos = locatePrevious(cpos);
    cpos = newpos;
    displayLCD(cpos);
    //Serial.print(menu[cpos]);
    //Serial.println();
    delay(200);
    leftVal=LOW;
  }
  }

}//end of loop


int locateNext(int cposh)
{
 
  int elem = 0;
    pos = cposh+3;
    elem = menu[cposh+1].toInt();
    while(elem!=0)
    {
      if(menu[pos]==0)
      {
        elem--;
        pos=pos+2;
      }
    else
  {
    pos = locateNext(pos-1);
    elem--;
  }  
    }
    return pos;}
    


int locateEnter(int cposh){
  int elem=0;
 elem = menu[cposh+1].toInt();
 if(elem==0){
    return -1;
 }
 else{
   return cposh+2;
 }
}

int locatePrevious(int cposh){
  if(menu[cposh-1]=="0"){
  nback--;
  return backel[nback]; 
}
else
{
  return cposh-2;
}
}
void gotomain()
{
  asm volatile(" jmp 0");
  //Serial.print("Paydirt Solution");
}
void depth()
{
  displayNew("Recording Value");
  int c = 10;
  while(c>=1){
  cm = cm + distanceUS();
  c--;
  delay(100);
}
  cm = cm/10;
  int addr=0;
  EEPROM.write(addr,cm);
  displayNew("Value Recorded");
  lcd.setCursor(0,1);
  lcd.print(cm);
  lcd.print(" ");
  lcd.print("cm");
  delay(1500);
  homescreen();
}
void low()
{
  displayNew("Recording Value");
  int c = 10;
  while(c>=1){
  cm = cm + distanceUS();
  c--;
  delay(100);
}
 cm=cm/10;
  int addr=1;
  EEPROM.write(addr,cm);
  displayNew("Value Recorded");
  lcd.setCursor(0,1);
  lcd.print(cm);
  lcd.print(" ");
  lcd.print("cm");
  delay(1500);
  homescreen();
}
void high()
{
  displayNew("Recording Value");
  int c = 10;
  while(c>=1){
  cm = cm + distanceUS();
  c--;
  delay(100);
}
  cm = cm/10;
  int addr=2;
  EEPROM.write(addr,cm);
  displayNew("Value Recorded");
  lcd.setCursor(0,1);
  lcd.print(cm);
  lcd.print(" ");
  lcd.print("cm");
  delay(1500);
  homescreen();
}

int microsecondsToCentimeters(long microseconds)
{
  return microseconds / 29 / 2;
}
void resetDefault()
{
    displayNew("Resetting...");
    for (int i = 0; i < 100; i++)
    EEPROM.write(i, 0);
    //Serial.print("Paydirt Solution");
    displayNew("Reset Successful");
    delay(2000);
    //Serial.print("Press enter to goto menu");
    homescreen();
}
void settTime()
{
 workdone = true;
  int noofenter=0;
  int once = 0;
  int hr = 0;
  int mn = 0;
  int sec = 0;
  tmElements_t tm;
  boolean ampm = true;//false is pm
  while(workdone==true){
    int e = readEnter();
    noofenter += e;
   if(once==0){
     once++;
   

  if (RTC.read(tm)) {
    hr = tm.Hour;
    if(hr>12){ampm = false;hr=hr-12;}
    else if(hr==12){ampm=false;}
    mn = tm.Minute;
    sec = tm.Second;

    lcd.setCursor(0,0);
    lcd.print("Input Time h:m:s");
    lcd.setCursor(0,1);
    if(hr<10)
    {
         lcd.print("0");
         lcd.print(hr);
    }
    else 
    lcd.print(hr);
    lcd.print(':');
    if(mn<10)
    {
         lcd.print("0");
         lcd.print(mn);
    }
    else
    lcd.print(mn);
    lcd.print(':');
    if(sec<10)
    {
         lcd.print("0");
         lcd.print(sec);
    }
 else    
    lcd.print(sec);
    lcd.print(" ");
    if (ampm==true)
    {
      lcd.print("AM");
    }
    else
    lcd.print("PM");
  }
  }

  else{
    lcd.noAutoscroll();
    if(noofenter==0){
      if(digitalRead(left)==1){delay(200);recordTime();if(hr>1){hr--;}else{hr;}}
      else if(digitalRead(right)==1){delay(200);recordTime();if(hr<12){hr++;}else{hr=1;}}
      if(hr<10)
      {
        lcd.setCursor(0,1);
        lcd.print("0");
        lcd.setCursor(1,1);
        lcd.print(hr);
      }
      else
      {
        lcd.setCursor(0,1);
        lcd.print("1");
        lcd.setCursor(1,1);
        lcd.print(hr%10);
      }
    }
    else if(noofenter==1){
      if(digitalRead(left)==1){delay(200);recordTime();if(mn>=1){mn--;}else{mn;}}
      else if(digitalRead(right)==1){delay(200);recordTime();if(mn<59){mn++;}else{mn=0;}}
      if(mn<10)
      { 
        lcd.setCursor(3,1);
        lcd.print("0");
        lcd.setCursor(4,1);
        lcd.print(mn);
      }
      else
      {
        lcd.setCursor(3,1);
        lcd.print(mn/10);
        lcd.setCursor(4,1);
        lcd.print(mn%10);
      }
    }
    else if(noofenter==2){
      if(digitalRead(left)==1){delay(200);recordTime();if(sec>=1){sec--;}else{sec;}}
      else if(digitalRead(right)==1){delay(200);recordTime();if(sec<59){sec++;}else{sec=0;}}
      if(sec<10)
      { 
        lcd.setCursor(6,1);
        lcd.print("0");
        lcd.setCursor(7,1);
        lcd.print(sec);
      }
      else
      {
        lcd.setCursor(6,1);
        lcd.print(sec/10);
        lcd.setCursor(7,1);
        lcd.print(sec%10);
      }
    }
    else if(noofenter==3){
      if(digitalRead(left)==1 || digitalRead(right)==1){delay(200);if(ampm==true)ampm=false;
      else if(ampm==false)ampm=true;
    recordTime();if(ampm==true){ampm==false;}else{ampm==true;}}
      
      if(ampm==true)
      {
        lcd.setCursor(9,1);
        lcd.print("A");
        lcd.setCursor(10,1);
        lcd.print("M");
      }
     else if(ampm==false)
      {
        lcd.setCursor(9,1);
        lcd.print("P");
        lcd.setCursor(10,1);
        lcd.print("M");
      }
      
    }
    else if(noofenter==4){
      
      if(ampm == false){hr = hr + 12;}
      
      workdone = false;
      

    }
delay(150);  
}
  }
  
tm.Hour=hr;
tm.Minute=mn;
tm.Second=sec;
RTC.write(tm);
lcd.autoscroll();
displayNew("Time Set!");
delay(1500);
homescreen();

}
void setdDate()
{
  workdone = true;
  int noofenter=0;
  int once = 0;
  int days = 0;
  int months = 0;
  int years = 0;
  tmElements_t tm;
  while(workdone==true){
    int e = readEnter();
    noofenter += e;
   if(once==0){
     once++;
   

  if (RTC.read(tm)) {
    days = tm.Day;
    months = tm.Month+1;
    years = tmYearToCalendar(tm.Year);
    lcd.setCursor(0,0);
    lcd.print("Input date y:m:d");
    lcd.setCursor(0,1);
    lcd.print(years);
    lcd.print("/");
    if(months<10)
   {
    lcd.print("0"); 
    lcd.print(months);
   }
  else 
 lcd.print(months) ;
    
    lcd.print("/");
    if(days<10)
   {
    lcd.print("0"); 
    lcd.print(days);
   }
  else
   lcd.print(days);
  }
}
  else{
    if(noofenter==0){
      if(digitalRead(left)==1){delay(200);recordTime();years--;if(years<=2014){years=2014;}}
      else if(digitalRead(right)==1){delay(200);recordTime();years++;if(years>=2019){years=2019;}}
      lcd.noAutoscroll();
       
        lcd.setCursor(0,1);
        lcd.print("2");
        lcd.setCursor(1,1);
        lcd.print("0");
        lcd.setCursor(2,1);
        lcd.print("1");
        lcd.setCursor(3,1);
        lcd.print(years%10);
    }
    else if(noofenter==1){
      if(digitalRead(left)==1){delay(200);recordTime();if(months>=1){months--;}else{months;}}
      else if(digitalRead(right)==1){delay(200);recordTime();if(months<12){months++;}else{months=1;}}
      if(months<10)
      { 
        lcd.setCursor(5,1);
        lcd.print("0");
        lcd.setCursor(6,1);
        lcd.print(months);
      }
      else
      {
        lcd.setCursor(5,1);
        lcd.print(months/10);
        lcd.setCursor(6,1);
        lcd.print(months%10);
      }
    }
    else if(noofenter==2){
     int maximum_value=max_value(years,months);
      if(digitalRead(left)==1){delay(200);recordTime();if(days>=1){days--;}else{days;}}
      else if(digitalRead(right)==1){delay(200);recordTime();if(days<maximum_value){days++;}else{days=0;}}
      if(days<10)
      { 
        lcd.setCursor(8,1);
        lcd.print("0");
        lcd.setCursor(9,1);
        lcd.print(days);
      }
      else
      {
        lcd.setCursor(8,1);
        lcd.print(days/10);
        lcd.setCursor(9,1);
        lcd.print(days%10);
      }
    }
    else if(noofenter==3){
      tm.Day = days;
      tm.Month = months-1;
      tm.Year = years-1970;
      RTC.write(tm);
      workdone = true;
      displayNew("Date set!");
      delay(1500);
      homescreen();
    }
    
  
}
  delay(150);
  }
  
}
void fn0Morning()
{
 alarmTime("M");
 }
void fn0Evening()
{
 alarmTime("E");
 }
void fn1Morning()
{
  for(int i=3;i<=5;i++)
  {
    EEPROM.write(i,0);
  }
  displayNew("Deleted!");
  delay(1500);
  homescreen();
}
void fn1Evening()
{
  for(int i=6;i<=8;i++)
  {
    EEPROM.write(i,0);
  }
  displayNew("Deleted!");
  delay(1500);
  homescreen();
}

void functionALL(String menuName)
{
  if(menuName == "fn0Morning"){
   fn0Morning();
  }
  else if(menuName == "fn0Evening")
  {
    fn0Evening();
  }
  else if(menuName == "fn1Morning"){
   fn1Morning();
  }
  
  else if(menuName == "fn1Evening")
  {
    fn1Evening();
  }
  else if(menuName == "low")
  {
    low();
  }
  else if(menuName == "high")
  {
    high();
  }
  else if(menuName == "depth")
  {
    depth();
  }
  
  else if(menuName == "settTime")
  {
    settTime();
  }
  else if(menuName == "setdDate")
  {
    setdDate();
  }
  else if(menuName == "resetDefault")
  {
    resetDefault();
  }
  
  
}

//function returs height of water

  int distanceUS()
  {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(trigPin, LOW);

  durationUS = pulseIn(echoPin, HIGH);
  cm = microsecondsToCentimeters(durationUS);
  return cm;
}//end of distanceUS

int readEnter(){
  int duration = 0;
  while(digitalRead(enter)==HIGH)
  {
    duration++;
    delay(100);
  }
  if(duration>30)
  {
    gotomain();
    
  }
  if(duration > 0){return 1;}
  else{return 0;} 
}
int max_value(int years,int months)
{
  int maximum_value;
    if(months<=7)
    {
       if(months!=2)
       {
           if(months%2==0)
           {
             maximum_value=30;
           }
           else
           {
             maximum_value=31;
           }
       }
       else
       {
         if(years%4==0)
         {
            maximum_value=29;
         }
         else
         {
           maximum_value=28;
         }
       }
    }
    else //for months greater than 7
    {
           if(months%2==0)
           {
             maximum_value=31;
           }
           else
           {
             maximum_value=30;
           }
    }
    return maximum_value;
}
int alarmTime(String statuss)
{
    int alarmHour;
  int alarmMinute;
  int alarmSecond ;

 if(statuss=="M")
{
  alarmHour=EEPROM.read(3);
  alarmMinute = EEPROM.read(4);
  alarmSecond = EEPROM.read(5);
}
 else if(statuss=="E")
{
  alarmHour=EEPROM.read(6);
  alarmMinute = EEPROM.read(7);
  alarmSecond = EEPROM.read(8);
}
 workdone = true;
  int noofenter=0;
  int once = 0;
  int hr = 0;
  int mn = 0;
  int sec = 0;
  tmElements_t tm;
  boolean ampm = true;//false is pm
  while(workdone==true){
    int e = readEnter();
    noofenter += e;
   if(once==0){
     once++;

    if(alarmHour>12){ampm = false;alarmHour=alarmHour-12;}
    else if(alarmHour==12){ampm=false;}
    lcd.setCursor(0,0);
    lcd.print("Alarm Time h:m:s");
    lcd.setCursor(0,1);
    if(alarmHour<10)
    {
         lcd.print("0");
         lcd.print(alarmHour);
    }
    else 
    lcd.print(alarmHour);
    lcd.print(':');
    if(alarmMinute<10)
    {
         lcd.print("0");
         lcd.print(alarmMinute);
    }
    else
    lcd.print(alarmMinute);
    lcd.print(':');
    if(alarmSecond<10)
    {
         lcd.print("0");
         lcd.print(alarmSecond);
    }
 else    
    lcd.print(alarmSecond);
    lcd.print(" ");
    if (ampm==true)
    {
      lcd.print("AM");
    }
    else
    lcd.print("PM");
  
  }

  else{
    lcd.noAutoscroll();
    if(noofenter==0){
      if(digitalRead(left)==1){recordTime();if(alarmHour>1){alarmHour--;}else{alarmHour;}}
      else if(digitalRead(right)==1){recordTime();if(alarmHour<12){alarmHour++;}else{alarmHour=1;}}
      if(alarmHour<10)
      {
        lcd.setCursor(0,1);
        lcd.print("0");
        lcd.setCursor(1,1);
        lcd.print(alarmHour);
      }
      else
      {
        lcd.setCursor(0,1);
        lcd.print("1");
        lcd.setCursor(1,1);
        lcd.print(alarmHour%10);
      }
    }
    else if(noofenter==1){
      if(digitalRead(left)==1){recordTime();if(alarmMinute>=1){alarmMinute--;}else{alarmMinute;}}
      else if(digitalRead(right)==1){recordTime();if(alarmMinute<59){alarmMinute++;}else{alarmMinute=0;}}
      if(alarmMinute<10)
      { 
        lcd.setCursor(3,1);
        lcd.print("0");
        lcd.setCursor(4,1);
        lcd.print(alarmMinute);
      }
      else
      {
        lcd.setCursor(3,1);
        lcd.print(alarmMinute/10);
        lcd.setCursor(4,1);
        lcd.print(alarmMinute%10);
      }
    }
    else if(noofenter==2){
      if(digitalRead(left)==1){recordTime();if(alarmSecond>=1){alarmSecond--;}else{alarmSecond;}}
      else if(digitalRead(right)==1){recordTime();if(alarmSecond<59){alarmSecond++;}else{alarmSecond=0;}}
      if(alarmSecond<10)
      { 
        lcd.setCursor(6,1);
        lcd.print("0");
        lcd.setCursor(7,1);
        lcd.print(alarmSecond);
      }
      else
      {
        lcd.setCursor(6,1);
        lcd.print(alarmSecond/10);
        lcd.setCursor(7,1);
        lcd.print(alarmSecond%10);
      }
    }
    else if(noofenter==3){
      if(digitalRead(left)==1 || digitalRead(right)==1){recordTime();if(ampm==true){ampm==false;}else{ampm==true;}}
      
      if(ampm==true)
      {
        lcd.setCursor(9,1);
        lcd.print("A");
        lcd.setCursor(10,1);
        lcd.print("M");
      }
     else if(ampm==false)
      {
        lcd.setCursor(9,1);
        lcd.print("P");
        lcd.setCursor(10,1);
        lcd.print("M");
      }
      
    }
    else if(noofenter==4){
      if(ampm == false){alarmHour = alarmHour + 12;}
      
      workdone = false;
      

    }
delay(150);  
}
  }
  
if(statuss=="M"){
  EEPROM.write(3,alarmHour);
  EEPROM.write(4,alarmMinute);
  EEPROM.write(5,alarmSecond);
}
else if(statuss=="E"){
  EEPROM.write(6,alarmHour);
  EEPROM.write(7,alarmMinute);
  EEPROM.write(8,alarmSecond);

}
displayNew("Alarm Set!");
delay(1500);
homescreen();
}

void homescreen()
{
  resetMenu();
  rootscreen();
}

void rootscreen(){

lcd.clear();
lcd.setCursor(0,0);
tmElements_t tm;
if(RTC.read(tm)){
lcd.print(tm.Hour);
lcd.print(":");
lcd.print(tm.Minute);
lcd.print(":");
lcd.print(tm.Second);
}
lcd.setCursor(0,1);
int depth=EEPROM.read(0);
int low=EEPROM.read(1);
int high=EEPROM.read(2);
if(depth==0||high==0||low==0){
  lcd.print("Level not set");
}
else{
  int c_ht = distanceUS();
  int per = ((depth-c_ht)*100)/depth;
  lcd.print(per);
  lcd.print("%");
  if(c_ht<=high){motorTriggeroff();}
  else if(c_ht>=low){motorTriggeron();}
 }
 delay(200);
}


void motorTriggeron(){
 digitalWrite(relPin, HIGH);
}

void motorTriggeroff(){
  digitalWrite(relPin, LOW);
}

void displayLCD(int address){
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(menu[address]);
  delay(50);
}

void displayNew(String message){
 lcd.clear();
 lcd.setCursor(0,0);
 lcd.print(message);
 delay(50);
}

void resetMenu(){
  backel[0] = -1;
  backel[1] = -1;
  backel[2] = -1;
  cpos=0;
  ppos=0;
  nback=0;
  pos=0;
  menuopen = false;
  workdone = false;
  rootscreen();
}
void recordTime()
{
  tmElements_t tm;
    if (RTC.read(tm)) {
    buttonHour = tm.Hour;
    if(buttonHour>12){buttonHour = buttonHour - 12;}
    buttonMinute = tm.Minute;
    buttonSecond = tm.Second;
}

}
void checkActivity()
{
  tmElements_t tm;
  if (RTC.read(tm)) {
  int currentHour = tm.Hour;
  int currentMinute = tm.Minute;
  int currentSecond = tm.Second;
  long preSec = buttonHour*3600 + buttonMinute*60 + buttonSecond;
  long curSec =  currentHour*3600 + currentMinute*60 + currentSecond;
  long diff = curSec-preSec;
  if(diff>=30){
   homescreen();
  }
}
}
