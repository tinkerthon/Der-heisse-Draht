; hd02
; Heisser Draht 02
symbol zaehler = b0	' Variablenname zur besseren Lesbarkeit
zaehler = 0

do
	if pin1 is on then
				' Dauert Ber�hrung l�nger als 0,2s,
				' wird sie mehrfach gez�hlt
		zaehler = zaehler + 1
				' Ausgabe des Z�hlers
		sertxd (#zaehler, lf)
		high 0
		pause 200	' LED blinkt kurz
		low 0
	endif
loop
