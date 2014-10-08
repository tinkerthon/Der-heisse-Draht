; p02a
; 15x Blinken an Pin 0

symbol LED = 0
symbol dauer = 500
symbol anzahl = 15

main:	for b1 = 1 to anzahl
		high LED
		pause dauer
		low LED
		pause dauer
	next b1
	
	end