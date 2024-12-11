extends Node

##TODO STEP 3: THE PIPE
#@export var pipe_scene : PackedScene

##TODO STEP 1: THE BIRD
#var game_running : bool
#var game_over : bool
#
#var scroll 
#var score
#const SCROLL_SPEED : int = 4 
#
#var screen_size : Vector2
#var ground_height : int
#
#var pipes : Array
#const PIPE_DELAY : int = 100
#const PIPE_RANGE : int = 200

func _ready() -> void:
	pass
	##TODO STEP 2: GROUND
	#screen_size = get_window().size
	
	##TODO STEP 3: PIPES
	#ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	
	##TODO STEP 1: THE BIRD
	#new_game()
		

func new_game():
	pass
	##TODO STEP 1: THE BIRD
	#game_running = false
	#game_over = false
	#scroll = 0
	
	##TODO STEP 4: THE SCORE
	#score = 0
	#$ScoreLabel.text = "SCORE: " + str(score)
	
	##	TODO STEP 5: RESTART GAME
	#$GameOver.hide() 		#Hide the buton when new game starts
	#get_tree().call_group("pipes", "queue_free") #delete all existing pipes of last game
	
	##TODO STEP 3: THE PIPES
	#pipes.clear()
	#generate_pipes()
	
	##STEP 1: THE BIRD
	#$Bird.reset() 			#Run the birds reset function

func _input(event):
	pass
	##TODO STEP 1: THE BIRD
	#if game_over == false: 
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				#if game_running == false:
					#start_game() #First mouse click starts the game
				#else:
					#if$Bird.flying:
						#$Bird.flap()
						
						##TODO STEP 3: THE PIPES
						#check_top() #Check if the bird flaps too high and is off the screen = kill
					

func start_game():
	pass
	##TODO STEP 1: THE BIRD
	#game_running = true
	#$Bird.flying = true
	#$Bird.flap()
	
	##TODO STEP 3: THE PIPE
	#$PipeTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	#TODO STEP 2: THE GROUND
	#if game_running: 
		#scroll += SCROLL_SPEED
		#if scroll >= screen_size.x:
			#scroll = 0
		#$Ground.position.x = -scroll
		
		##TODO STEP 3: THE PIPES
		#for pipe in pipes: 
			#pipe.position.x -=SCROLL_SPEED #take the position of each pipe

#TODO STEP 3: THE PIPES
#func _on_pipe_timer_timeout() -> void:
	##Timer generate_pipes() every 1.5seconds
	#generate_pipes()

#TODO STEP 3: THE PIPES
#func generate_pipes():
	#var pipe = pipe_scene.instantiate()
	#
	##Put the x of the pipe on the end of the screen and add a delay so it slides in from the right
	#pipe.position.x = screen_size.x + PIPE_DELAY
	##based on the height of the space, random value makes each pipe a different height
	#pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	#
	##Function that happens when bird hites the pipes
	#pipe.hit.connect(bird_hit)
	
	##TODO STEP 4: THE SCORE
	##pipe.scored.connect(scored)
	#
	#add_child(pipe)					#We add pipe as a child of the main scene
	#pipes.append(pipe) 				#Add Pipes to array to keep track of them.

##TODO STEP 4: THE SCORE
#func scored():
	##Update the label text
	#score += 1
	#$ScoreLabel.text = "SCORE: " + str(score)

##TODO STEP 3: THE PIPES
#func check_top():
	##When you are flying out of the screen
	##If bird ypos is below zero it is off the screen
	#if $Bird.position.y < 0:
		#$Bird.falling = true
		#stop_game()

##TODO STEP 3: THE PIPES
#func stop_game():
	#$PipeTimer.stop()
	
	##TODO STEP 5: RESTART
	##$GameOver.show()
	
	#$Bird.flying = false
	#game_running = false
	#game_over = true

##TODO STEP 3: THE PIPES
#func bird_hit():
	##When you hit the pipes, bird dies and falls to the ground. 
	#$Bird.falling = true
	#stop_game()

##TODO STEP 3: THE PIPES
#func _on_ground_hit():
	##When hitting the ground
	#$Bird.falling = false
	#stop_game()

##TODO STEP 5: RESTART GAME
#func _on_canvas_layer_restart() -> void:
	#new_game()
