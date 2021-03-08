extends KinematicBody2D

var paddle
var collison
var shot = false
var velocity = Vector2()
export var minForce = 0
export var maxForce = 0

func _ready():
	paddle = get_parent().get_node("Paddle")
	velocity = Vector2(0, 0)
	position.x = paddle.position.x
	position.y = paddle.position.y - 26

func _physics_process(delta):
	if !shot:
		position.x = paddle.position.x
		position.y = paddle.position.y - 26
		shoot()
	else:
		collison = move_and_collide(velocity * delta)
		if collison:
			velocity = velocity.bounce(collison.normal)
			if(get_parent().find_node("Blocks").get_children().has(collison.collider)):
				collison.collider.breakBlock()
				
		if Input.is_key_pressed(KEY_ESCAPE):
			PlayerVars.playerScore = 0
			get_tree().change_scene("Scenes/Game.tscn")
		
		if Input.is_key_pressed(KEY_BACKSPACE):
			get_tree().quit()
		
		if get_parent().find_node("Blocks").get_children().size() < 1:
			get_tree().change_scene("Scenes/WinScreen.tscn")

func shoot():
	if Input.is_key_pressed(KEY_SPACE):
		shot = true
		velocity = Vector2(rand_range(minForce, maxForce), rand_range(minForce, maxForce))
