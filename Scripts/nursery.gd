extends Node2D

var target_position : float = 0
var camera_speed : float = 5 

func _ready():
	Global.connect("purchased", _on_purchased)
	var time_node = get_node("UI/time_system")
	if time_node:
		print_debug("Nó time_system encontrado!")
		time_node.connect("time_reached", Callable(self, "_on_time_reached"))
	else:
		print_debug("Erro: Nó TimeSystem não encontrado")
	
	var ownedVases = Global.Vases
	for child in $Vases.get_children():
		if ownedVases > 0:
			child.owned = true
			ownedVases -= 1
		child.visible = child.owned
		child.connect("harvested", _on_harvested)
	
	$UI/Money.text = "$ " + str(Global.Money)
	$UI/Daisy.text = str(Global.inventory["Daisy"]["Flowers"])
	$UI/Buttercup.text = str(Global.inventory["Buttercup"]["Flowers"])
	$UI/Tulip.text = str(Global.inventory["Tulip"]["Flowers"])
	$UI/Rose.text = str(Global.inventory["Rose"]["Flowers"])

func _on_harvested(sellPrice, seedType):
	Global.Money += sellPrice
	$UI/Money.text = "$ " + str(Global.Money)
	
	Global.inventory[seedType]["Flowers"] += 1
	$UI.get_node(seedType).text = str(Global.inventory[seedType]["Flowers"])

func _on_purchased():
	$UI/Money.text = "$ "+str(Global.Money)

func _on_phase_change_pressed():
	if $Camera.tween == false:
		$Player.flip_h = !$Player.flip_h
		
		$Camera.tween = true
		if $Camera.position.x == 1050:
			$Camera.target = 0
		elif $Camera.position.x == 0:
			$Camera.target = 1050
#	print($Camera.position.x)

func _on_time_reached(hours):
	print_debug("Sinal recebido. Hora:", hours) 

	if hours == 9:
		print("Hora 9 detectada")
		if $Camera.position.x == 0:
			target_position = 1050
	if hours == 6:
		print("Hora 6 detectada")
		if $Camera.position.x == 1050:
			target_position = 0

func _process(delta):
	if $Camera.position.x != target_position:
		$Camera.position.x = lerp($Camera.position.x, target_position, camera_speed * delta)
