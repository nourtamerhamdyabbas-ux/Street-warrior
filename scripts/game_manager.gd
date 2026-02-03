extends Node2D  

@onready var player: CharacterBody2D = %player


const LEFT_LIMIT = -150
const TOP_LIMIT = -100
const BOTTOM_LIMIT = 700

func _process(delta):
	if player_is_out_of_bounds():
		restart_scene()

func player_is_out_of_bounds() -> bool:
	var pos = player.global_position
	return pos.x < LEFT_LIMIT or pos.y < TOP_LIMIT or pos.y > BOTTOM_LIMIT

func restart_scene():
	get_tree().reload_current_scene()
