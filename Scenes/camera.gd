extends Camera2D

var tween = false
var target:float

func _process(delta):
	if tween:
		position.x = lerp(position.x, target, 0.1)
		if round(position.x) == target:
			position.x = target
			tween = false
