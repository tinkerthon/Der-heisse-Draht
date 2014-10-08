; hd02a
; Heisser Draht 02
symbol zaehler = b0	' Variablenname zur besseren Lesbarkeit
zaehler = 0

do
    if pin3 = 1 then
	    zaehler = 0
	endif

	if pin1 = 1 then
				' Dauert Berührung länger als 0,2s,
				' wird sie mehrfach gezählt
		zaehler = zaehler + 1
				' Ausgabe des Zählers
		sertxd (#zaehler, lf)
		high 0
		pause 200	' LED blinkt kurz
		low 0
	endif
loop
