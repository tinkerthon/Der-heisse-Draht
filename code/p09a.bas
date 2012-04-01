; p09a
; Nachtlicht

symbol LED = 0
symbol LDR = input1

do
	if LDR is on then
		low LED
	else
		high LED
	endif
loop
	