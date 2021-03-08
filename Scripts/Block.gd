extends StaticBody2D

export var points = 10
export var hitsToBreak = 1
export (Texture) var texture
export (Texture) var texture2
export (Texture) var texture3
var hits = 0
var sprite
var particles
var timer

func _ready():
	sprite = get_node("Sprite")
	particles = get_node("Particles2D")
	timer = get_node("Timer")
	timer.connect("timeout", self, "disableParticles")
	particles.emitting = false

func breakBlock():
	hits+=1
	if hits == 1: 
		sprite.set_texture(texture2)
	elif hits <= 2: 
		sprite.set_texture(texture3)
	
	if(hits >= hitsToBreak):
		PlayerVars.playerScore += points
		particles.emitting = true
		for c in  get_children():
			if(c != get_node("Particles2D") && c != get_node("Timer") ):
				remove_child(c)
		timer.set_wait_time(0.5)
		timer.start()

func disableParticles():
	particles.emitting = false
	get_parent().remove_child(self)
