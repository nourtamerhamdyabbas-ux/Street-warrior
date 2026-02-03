extends Node

@export var platforms: Array[PackedScene]
@export var coin_scene: PackedScene 

@onready var marker: Marker2D = $Marker2D

func _on_timer_timeout() -> void:
	
	var random_platform: PackedScene = platforms.pick_random()
	var platform_instance: Node = random_platform.instantiate()
	add_child(platform_instance)
	
	platform_instance.position = marker.position
	var random_y_position: float = randf_range(300, 600)
	platform_instance.position.y = random_y_position
	
	
	if coin_scene:
		var coin_instance = coin_scene.instantiate()

		platform_instance.add_child(coin_instance)

		coin_instance.position = Vector2(0, -40)
