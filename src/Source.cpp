#include <cstdio>
#include <pigpio.h>

int main(){

	if(gpioInitialise()<0) return 1;
	gpioSetMode(23, PI_OUTPUT);
	gpioSetMode(24, PI_OUTPUT);
	int range = gpioSetPWMrange(23, 1000);
	int frequency = gpioSetPWMfrequency(23, 320);

	printf("[0, %d]; %dHz\n", range, frequency);

	//gpioPWM(23, 1000);
	//gpioWrite(24, 1);

	for(int i = 0;;i++){
		if(i > 1000) i = 0;
		gpioPWM(23, i);
		if(i > 500){
			gpioWrite(24, 1);
		}else{
			gpioWrite(24, 0);
		}
		gpioDelay(1000);
	}

	gpioTerminate();

	return 0;
}