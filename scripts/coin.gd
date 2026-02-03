extends Area2D 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:


	if body.name == "player": 

		var hud = get_tree().get_first_node_in_group("hud")
		
		if hud:
			hud.add_bonus_points(20) 
		
	animation_player.play("pickup")
