#include <SoftwareSerial.h>

#define N 2 //pin number
int TxD;
int RxD;
int data;
int fsrPin[N] = {0,1};     //the pins which the FSR and 10K pulldown are connected to
int fsrReading[N];     // the analog reading from the FSR resistor divider
SoftwareSerial bluetooth(TxD, RxD);

void setup() {
  Serial.begin(9600); 
  bluetooth.begin(9600);
}

void loop(){
  if(bluetooth.available() > 0){
    data = bluetooth.read();
    for(int i=0;i<N;i++){
      fsrReading[i] = analogRead(fsrPin[i]);
      Serial.println(fsrReading[i]);     // the raw analog reading
    }
    if(data == 1) {         
      digitalWrite(11, HIGH);
    }else if(data == 0){
      digitalWrite(11, LOW); 
    }
  }
}
