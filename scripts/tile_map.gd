extends TileMap

@export var speed := 500.0
@export var map_width := 3800.0   

func _process(delta):
	position.x -= speed * delta

	if position.x <= -map_width:
		position.x += map_width * 2
