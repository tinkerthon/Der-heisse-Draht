; p02
; 15x Blinken an Pin 0

main:	for b1 = 1 to 15
		high 0
		pause 500
		low 0
		pause 500
	next b1
	
	end