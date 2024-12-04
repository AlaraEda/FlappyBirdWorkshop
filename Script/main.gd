extends Node

#Add pipes through the code
@export var pipe_scene : PackedScene

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
	screen_size = get_window().size
	
	#Knowing the height of the ground isn nessecary to position the pipes
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()
		

func new_game():
	#reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	
	pipes.clear()
	generate_pipes()		#Generate Start-Pipes before the timer auto-generatest hem
	
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
	
	#Start pipe timer
	$PipeTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Scroll the ground
	if game_running: 
		scroll += SCROLL_SPEED
			
		#Reset if we scroll passed the width of the screen
		if scroll >= screen_size.x:
			scroll = 0
			
		#Move Ground Node
		$Ground.position.x = -scroll
		
		#Scroll through the pipes list
		for pipe in pipes: 
			pipe.position.x -=SCROLL_SPEED #take the position of each pipe


func _on_pipe_timer_timeout() -> void:
	#Timer generate_pipes() every 1.5seconds
	generate_pipes()
	
func generate_pipes():
	var pipe = pipe_scene.instantiate()
	
	#Put the x of the pipe on the end of the screen and add a delay so it slides in from the right
	pipe.position.x = screen_size.x + PIPE_DELAY
	#based on the height of the space, random value makes each pipe a different height
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	
	#Function that happens when bird hites the pipes
	pipe.hit.connect(bird_hit)
	add_child(pipe)					#We add pipe as a child of the main scene
	pipes.append(pipe) 				#Add Pipes to array to keep track of them.

func bird_hit():
	pass
