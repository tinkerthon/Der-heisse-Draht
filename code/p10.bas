; p10
; Ein LDR an Pin 1

; Warum blinkt die LED, wenn man
; den Lichtfühler auf die LED richtet?

do
	readadc 1, b1
	pause 500
	if b1 > 80 then
		low 0
	else
		high 0
	endif
loop
