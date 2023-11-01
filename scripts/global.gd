extends Node

var total_coins = 0
var level = 0
var lives = 3
var Beerscene = preload("res://beer.tscn")
func spawn_beer_bottle(pos):
	
	var beer = Beerscene.instantiate()
	
	get_tree().root.add_child(beer)
	beer.global_position = pos
