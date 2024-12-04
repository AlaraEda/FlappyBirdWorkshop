extends Node

#determine the game state
var game_running : bool
var game_over : bool

var scroll #used to move the images across the screen
var score
const SCROLL_SPEED : int = 4 #You can make the game slower or faster by adjusting

var screen_size : Vector2
var ground_height : int

var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
		

func new_game():
	#reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Bird.reset() 			#Run the birds reset function

func _input(event):
	#Mouse clicked while game playing
	if game_over == false: 
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game() #First mouse click starts the game
				else:
					if$Bird.flying:
						$Bird.flap()
					

func start_game():
	game_running = true
	$Bird.flying = true
	$Bird.flap()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
