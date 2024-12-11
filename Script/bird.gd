extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_VEL : int = 600  			#limit the max fallspeed
const FLAP_SPEED : int = -500 		#controls how much the bird jumps up
var flying : bool = false			#active as long as no collision
var falling : bool = false			#ative if bird hits pipe
const START_POS = Vector2(100, 400)

func _ready():
	reset()
	
func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)

#Handles all the birds movements
func _physics_process(delta):
	#Bird is in the air
	if flying or falling:
		velocity.y += GRAVITY * delta
		
		#terminal velocity, make sure that the velocity can never be higher than the max
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2) #rotate the bird to being face down
			$AnimatedSprite2D.stop()
		
		#move the bird (????)
		move_and_collide(velocity * delta)
	
	#Not in the air
	else: 
		$AnimatedSprite2D.stop()

#Allow bird to flap and fly upwards
func flap():
	velocity.y = FLAP_SPEED
