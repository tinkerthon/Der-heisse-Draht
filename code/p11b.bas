; p11
; Weiches an/aus

#no_data

symbol stufen = 250
symbol hell_1 = b1
symbol hell_2 = b2

symbol LED_1 = 0
symbol LED_2 = 4

servo LED_1, 5
servo LED_2, 250

hell_2 = stufen

do
	' langsam heller werden
	for hell_1 = 5 to stufen
		dec hell_2
		gosub anzeige
	next
	
	' langsam dunkler werden
	for hell_1 = stufen to 5 step -1
		gosub anzeige
		inc hell_2
	next
loop

anzeige:
	servopos LED_1, hell_1
	servopos LED_2, hell_2
	pause 5
	return
