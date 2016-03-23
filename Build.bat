@echo off
@setlocal

IF NOT EXIST bin mkdir bin
IF NOT EXIST temp mkdir temp

pushd temp

set CommonCompilerFlags= -std=c++1y -ggdb -fext-numeric-literals "-IZ:/Raspberry Pi/5428-Liquid/inc" -O0 -g3 -w
set CommonLinkerFlags= -shared-libgcc -fPIC


arm-linux-5428-g++ %CommonCompilerFlags% -c -fmessage-length=0 "-IC:/Users/Zaeem/rPi/WiringPi/wiringPi" "-IC:/Users/Zaeem/rPi/pigpio" "../src/Source.cpp"

REM arm-linux-5428-g++ "-LC:/Users/Zaeem/wpilib/cpp/current/lib" -Wl,-rpath,/opt/GenICam_v2_3/bin/Linux_armv7-a -o "..\\..\\bin\\FRCUserProgram"  -Wl,-Map,EHL.map "EHL.o" -lwpi 
arm-linux-5428-g++ "-L../lib" -o "../bin/Test"  -Wl,-Map,Source.map "Source.o" -lwiringPi -lpthread -lrt -lpigpio

popd

