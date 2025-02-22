extends Control

@export var bgSpeed: float = 1
#Ia usar variáveis pra uma navegação mais flexível, mas pela pressa e
#por serem poucas opções foi mais fácil fazer na marra
#var active
#var previous

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	$BGmoving.position += Vector2(-bgSpeed, (bgSpeed/2))
	if $BGmoving.position.x < -190:
		$BGmoving.position.x = 0
	if $BGmoving.position.y > 0:
		$BGmoving.position.y = -63

func _on_start_pressed():
	$AnimationPlayer.play("fade out")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/nursery.tscn")

func _on_controls_pressed():
	$Main.visible = false
	$Controls.visible = true
	$Back.visible = true

func _on_credits_pressed():
	$Main.visible = false
	$Credits.visible = true
	$Back.visible = true
	
func _on_back_pressed():
	$Controls.visible = false
	$Credits.visible = false
	$Back.visible = false
	$Main.visible = true

func _on_exit_pressed():
	get_tree().quit()
