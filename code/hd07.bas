; hd02
; Heisser Draht 02

#no_data

symbol zeit = w0
symbol zaehler = b2
symbol ist_an = b3
symbol ticks = b4
symbol punkte = b5
symbol letzter_wert = b6

symbol draht = pin1
symbol taster = pin3

symbol computer = 0
symbol wahr = 1
symbol falsch = 0

symbol led1 = 0
symbol led2 = 4

do
	serout computer, N2400_4, ("ok", cr, lf)
	
	do
	loop until taster is off

	do
	loop until taster is on

	zaehler = 0
	zeit = 0
	ist_an = falsch

	do
		low led1
		low led2

		if taster is off then
			goto ende
		endif
	
		if ist_an = wahr then
			if draht is off then
				ist_an = falsch
			endif
		else
			if draht is on then
				zaehler = zaehler + 1
				ist_an = wahr
				high led1
			endif
		endif
	
		ticks = zeit % 30
		if ticks = 0 then
			'serout computer, N2400_4, (#zaehler, ", t:", #zeit, cr, lf)
			high led2
			gosub soundup
	
		endif

		pause 20
		zeit = zeit + 1
	loop

ende:
	gosub sounddown
	punkte = zeit / 30 + zaehler
	serout computer, N2400_4, (#zaehler, "/", #zeit, "/", #punkte, cr, lf)

	do
		high led1
		pause 50
		low led1
		pause 500
		letzter_wert = punkte
		punkte = punkte - 1
	loop until punkte >= letzter_wert

loop

soundup:
	sound 2,(84,10, 89, 5)
	return

sounddown:
	sound 2,(89, 10, 84, 5)
	return


