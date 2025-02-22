extends Area2D

signal order_up

func _ready():
	pass # Replace with function body.

func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action("click") and Input.is_action_just_released("click"):
		emit_signal("order_up")
#		fade
#		await 
		queue_free()
