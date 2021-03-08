extends Button

func _pressed():
	get_tree().change_scene("Scenes/Game.tscn")
	PlayerVars.playerScore = 0
