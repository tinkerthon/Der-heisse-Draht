; hd03
; Heisser Draht 04

#no_data

symbol zaehler = b0	' Variablenname zur besseren Lesbarkeit
symbol zeit = b1
symbol punkte = w2
zaehler = 0
zeit = 0

do
	zeit = zeit + 1
	if pin1 is on then
				' Dauert Berührung länger als 0,2s,
				' wird sie mehrfach gezählt
		zaehler = zaehler + 1
				' Ausgabe des Zählers
		high 0
	endif

	pause 200	' LED blinkt kurz
	low 0

' Ende, wenn Taster gedrückt
loop until pin3 is on


' punkte = 100 - (zaehler * 10) - zeit
punkte = zaehler * 10
punkte = 1000 - punkte
punkte = punkte - zeit
sertxd ("Punkte: ", #punkte, ", Zaehler: ", #zaehler, ", Zeit; ", #zeit, lf)

