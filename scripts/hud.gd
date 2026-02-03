extends CanvasLayer

@onready var score_label: Label = $ScoreLabel


static var session_best_score: int = 0

var score: float = 0
var score_rate: float = 5

func _ready():

	update_label()

func _process(delta):
	score += score_rate * delta
	var current_score = int(score)


	if current_score > session_best_score:
		session_best_score = current_score
	
	update_label()

func update_label():
	score_label.text = "BEST: %04d\n%04d" % [session_best_score, int(score)]

func reset_score():
	score = 0
	update_label()


func add_bonus_points(amount: int):
	score += amount
	update_label()
