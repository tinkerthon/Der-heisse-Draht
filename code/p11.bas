; p11
; Weiches an/aus

#no_data

' Microcontroller mit 16MHz statt 4MHz
setfreq m16

symbol stufen = 80
symbol LEDan = b1
symbol LEDaus = b2

symbol LED = 0


LEDaus = stufen

do
	' langsam heller werden
	for LEDan = 1 to stufen
		dec LEDaus
		gosub anzeige
	next
	
	' ganz an
	high LED
	pause stufen
	
	' langsam dunkler werden
	for LEDan = stufen to 1 step -1
		gosub anzeige
		inc LEDaus
	next
	
	'ganz aus
	low LED
	pause stufen
loop
end

anzeige:
	' LED mit bestimmter Helligkeit
	high LED
	pause LEDan
	low LED
	pause LEDaus
	return
	