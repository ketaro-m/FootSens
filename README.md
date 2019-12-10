FootSens
====
A force tracking system to measure ground reaction forces in the foot.  
The data is transmitted to a nearby PC in real time via Bluetooth.  

<img width="400" alt="poster.png" src="https://github.com/ketaro-m/foot_sensor/blob/master/img/poster.png">

## Material, Environment

- [Arduino UNO R3](https://www.amazon.com/Arduino-Uno-R3-Microcontroller-A000066/dp/B008GRTSV6/ref=sr_1_4?ie=UTF8&qid=1532009862&sr=8-4&keywords=%E2%80%A2%09Arduino+Uno++usb&dpID=61GN8biQEHL&preST=_SX300_QL70_&dpSrc=srch)
- [Bluetooth Module HC-05](https://www.amazon.com/gp/product/B01G9KSAF6/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) <- Only "HC-05" and "HC-06" are supported by MATLAB.
- [Force Sensing Resistor](https://www.amazon.com/gp/product/B00B887CLS/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
- Resistors; 10kΩ for FSRs and 10Ω for LED
- LED
- MATLAB R2019a ([Instrument Control Toolbox](https://jp.mathworks.com/products/instrument.html) installed)

## Circuit
- prototype1.0
<img width="700" alt="poster.png" src="https://github.com/ketaro-m/foot_sensor/blob/master/img/circuit.png">

- Final prototype
<img width="300" alt="prototype.png" src="https://github.com/ketaro-m/foot_sensor/blob/master/img/prototype.gif">

## Usage
### Initial Setting
At first, you need to connect the device to your computer itself. PIN number for this bluetooth module is "1234".
- Mac  
"System Preferences" -> "Bluetooth" -> "Devices"
- Windows  
"Settings" -> "Devices" -> "Bluetooth & other devices"

### Command on MATLAB
Once you open MATLAB, please connect the device typing these command.
```
>> instrhwinfo('Bluetooth','DSD TECH HC-05');
>> bt = Bluetooth('DSD TECH HC-05', 1);
>> fopen(bt);
```
If you successfully open the bluetooth, move to the directory in which "main.m" exists and run it.
```
>> main
```
Then input a file name and measurement time into a dialog showing up, and click "OK".
<img width="300" alt="inputDialog.png" src="https://github.com/ketaro-m/foot_sensor/blob/master/img/inputDialog.png">

In a few seconds, LED on the device will turn on and the measurement will start.  
You can monitor the tracknig in real time and the monitor will be saved as an avi file in the same directory.

## Demo
<img width="400" alt="demo.gif" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/505262/31ee205e-98d5-f615-a16e-a843d6219071.gif">

