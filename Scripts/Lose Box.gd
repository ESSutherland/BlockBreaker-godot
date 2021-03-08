extends Area2D

export (NodePath) var ball

func lose():
		get_tree().change_scene("Scenes/LoseScreen.tscn")

func _on_Lose_Box_body_entered(body):
	print("CONNECT")
	if(body == get_node(ball)):
		lose()
