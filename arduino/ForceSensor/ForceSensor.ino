#include <SoftwareSerial.h>
int TxD;
int RxD;
int data;
int count=0;
SoftwareSerial bluetooth(TxD, RxD);

void setup() {
  Serial.begin(9600); 
  bluetooth.begin(9600);
}

void loop(){
  if(bluetooth.available() > 0){
    data = bluetooth.read();    
    //Serial.print(data);       
    //Serial.print("\n"); 
    
    bluetooth.println(count);
    Serial.print(data);
    count++;
  }
}
