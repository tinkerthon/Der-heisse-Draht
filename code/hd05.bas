; hd05
; Heisser Draht 05
; 
; Berührungen per Interrupt
; Ton am Anfang, Ende und bei Berührung
; Taster für Start und Ende
; Punkte blinken am Ende
; 
symbol zaehler = b0	' Variablenname zur besseren Lesbarkeit
symbol zeit = b1
symbol ticks = w2
symbol punkte = w3
symbol blink = b6

symbol taster = pin3
symbol draht = pin1

do	
	pause 200
	sertxd ("hd05 - Taste druecken", lf)
	
	setint off

	' Warte auf START
	do
	loop until taster is on
	pause 200
	do
	loop until taster is off
	gosub soundup


	setint %00000010, 00000010

	zaehler = 0
	ticks = 0
	zeit = 20

	do
		low 4
		ticks = ticks + 1
		blink = ticks // 200
		if blink = 0 then
			zeit = zeit - 1
			high 4
			gosub soundup
			;; sertxd (#zeit, " / ", #zaehler, lf)
			if zeit = 0 then
				goto ende
			endif
		endif

	' Ende, wenn Taster gedrückt
	loop until taster is on

ende:

	tune 0,2,(89, 87, 85, 83, 82, 80)

	pause 200

	' punkte = 1000 - (zaehler * 10) + zeit
	punkte = zaehler * 10
	punkte = 1000 - punkte
	punkte = punkte + zeit

	' Überlauf
	if punkte > 1000 then
		punkte = 0
	endif

	sertxd ("Punkte: ", #punkte, ", Zeit: ", #zeit, ", Beruehrungen; ", #zaehler, lf)

	for ticks = punkte to 1000 step 10
		high 4
		pause 50
		low 4
		pause 500
	next ticks 

	do
	loop until taster is off
loop


sounddown:
	tune 0,2,(84,89)
	return

soundup:
	tune 0,2,(89,84)
	return

interrupt:
	zaehler = zaehler + 1
	high 0
	gosub sounddown
	pause 200	' rechte LED blinkt
	low 0
	setint %00000010, 00000010
	return
