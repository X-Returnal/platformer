extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = "coins: " + str(Global.total_coins)
	$Label2.text = "Lives: " + str(Global.lives)
