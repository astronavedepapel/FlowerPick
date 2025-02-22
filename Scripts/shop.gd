extends Node2D

func _ready():
	Global.connect("purchased", _on_purchased)
	
	update_UI()

func _process(_delta):
	pass

func update_UI():
	$UI/Money.text = "$ "+str(Global.Money)
	$UI/Daisy.text = str(Global.inventory["Daisy"]["Flowers"])
	$UI/Buttercup.text = str(Global.inventory["Buttercup"]["Flowers"])
	$UI/Tulip.text = str(Global.inventory["Tulip"]["Flowers"])
	$UI/Rose.text = str(Global.inventory["Rose"]["Flowers"])

func _on_purchased():
	$UI/Money.text = "$ "+str(Global.Money)

func _on_supplies_pressed():
	update_UI()
	
	for child in get_children():
		if child.is_in_group("purchaseable"):
			child.refresh()
			child.visible = true
	visible = !visible
