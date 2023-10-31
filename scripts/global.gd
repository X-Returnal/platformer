extends Node

var total_coins = 0
var level = 0
var lives = 3

func spawn_beer_bottle(pos):
	var Beerscene = load("res://beer.tscn")
	var beer = Beerscene.instantiate()
	beer.global_position = pos
	get_tree().root.add_child(beer)
