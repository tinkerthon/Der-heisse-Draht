; Heisser Draht 03a
; Messen der Zeit mit der "time"-Variable des 08M2

#picaxe 08m2
#no_data

do
	low 0
	pause 200
	high 0
	pause 200
	
	sertxd ("Zeit: ", #time, lf)
loop
