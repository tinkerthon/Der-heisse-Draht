; hd04
; Heisser Draht 04
symbol zaehler = b0	' Variablenname zur besseren Lesbarkeit
symbol zeit = b1
symbol punkte = w2
zaehler = 0
zeit = 0

do
	zeit = zeit + 1
	if pin1 is on then
				' Dauert Ber�hrung l�nger als 0,2s,
				' wird sie mehrfach gez�hlt
		zaehler = zaehler + 1
				' Ausgabe des Z�hlers
		high 0
	endif

	pause 200	' LED blinkt kurz
	low 0

' Ende, wenn Taster gedr�ckt
loop until pin3 is on


' punkte = 100 - (zaehler * 10) - zeit
punkte = zaehler * 10
punkte = 1000 - punkte
punkte = punkte - zeit

' �berlauf
if punkte > 1000 then
	punkte = 0
endif
sertxd ("Punkte: ", #punkte, ", Zaehler: ", #zaehler, ", Zeit; ", #zeit, lf)

