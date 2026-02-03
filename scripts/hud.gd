extends CanvasLayer


@onready var score_label: Label = $ScoreLabel

# Score variables
var score: float = 0
var best_score: int = 0
var score_rate: float = 12.0 

func _ready():
	load_best_score()
	update_label()

func _process(delta):
	score += score_rate * delta

	var current_score = int(score)
	if current_score > best_score:
		best_score = current_score
		save_best_score() 

	update_label()


func update_label():
	score_label.text = "BEST: %04d\n%04d" % [best_score, int(score)]


func reset_score():
	score = 0
	update_label()


func load_best_score():
	if FileAccess.file_exists("user://best_score.save"):
		var f = FileAccess.open("user://best_score.save", FileAccess.READ)
		best_score = f.get_32()
		f.close()


func save_best_score():
	var f = FileAccess.open("user://best_score.save", FileAccess.WRITE)
	f.store_32(best_score)
	f.close()
