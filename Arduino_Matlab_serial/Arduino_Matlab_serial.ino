

int tempPin = 1;
float Temp; 
int val = 0;
int led = 13;
void setup() 
{
  Serial.begin(9600);
  Serial.println('a');
  char a = 'b';
  while (a != 'a')
  {
    a = Serial.read();
  }
}

void loop() 
{
  while (Serial.available() == 0)
  {
  }
  
  if (Serial.available() > 0)
  {
   val = Serial.read();
   if (val == 'R')
   {
     getTemperature();
   
   } 
    if(val == 'e')
   {
     minrule1();
   }
   if(val == 'f')
   {
     minrule2();
   }
   if(val == 'g')
   {
     maxrule1();
   }
   if(val == 'h')
   {
     maxrule2();
   } 
  }
  delay(100);
}

/////////////////////////////////////////////////////////////////////////
int getTemperature()
{
val = analogRead(tempPin);
float mv = ( val/1024.0)*5000; 
float cel = mv/10;
float farh = (cel*9)/5 + 32;
Serial.println(cel);
}
void minrule1(){
  pinMode(led, OUTPUT);
  digitalWrite(led,HIGH);
  delay (500);
  digitalWrite(led,LOW);
  delay(500);
  }
void minrule2(){
    pinMode(led, OUTPUT);
  digitalWrite(led,HIGH);
  delay (1000);
  digitalWrite(led,LOW);
  delay(1000);
 
  }
void maxrule1(){
  pinMode(led, OUTPUT);
  digitalWrite(led,HIGH);
  delay (500);
  digitalWrite(led,LOW);
  delay(500);
  digitalWrite(led,HIGH);
  delay(500);
  digitalWrite(led,LOW);
  }
 void maxrule2(){
  pinMode(led, OUTPUT);
  digitalWrite(led,HIGH);
  delay (1000);
  digitalWrite(led,LOW);
  delay(100);
  digitalWrite(led,HIGH);
  delay(1000);
  digitalWrite(led,LOW);
    delay(100);
  }     
