extends Node
var current_state
enum PlayerState {BASIC, THONG}
var coins = 0
var level = 0
var lives = 3
var Beerscene = preload("res://objects/beer.tscn")
var thongscene = preload("res://objects/thong_power_up.tscn")
func spawn_beer_bottle(pos):
	
	var beer = Beerscene.instantiate()
	
	get_tree().root.add_child(beer)
	beer.global_position = pos

func spawn_thong(pos):
	
	var thong = thongscene.instantiate()
	
	get_tree().root.add_child(thong)
	thong.global_position = pos
