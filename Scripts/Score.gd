extends Label

func _process(delta):
	text = "%03d" % PlayerVars.playerScore
