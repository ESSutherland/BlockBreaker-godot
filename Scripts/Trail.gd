extends Line2D

var point
var target
export var trailLength = 0
export(NodePath) var targetPath

func _ready():
	target = get_node(targetPath)

func _process(delta):
	if get_node("../..").shot:
		point = target.position
		add_point(point)
		while get_point_count() > trailLength:
			remove_point(0)
