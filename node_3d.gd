extends Node3D
var velocity = 0
var launch = false
var engine = false
var gravity = 9.81
var acceleration = 0
var bodymass=0.6
var fuelmass=0.6
var mass = 1.2
var thrust=12


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if launch == true:
		
		
		print(mass)
		print(velocity)
		print(acceleration)
		
		acceleration=0
		acceleration-=gravity
		 
		fuelmass-= 0.01 *delta
		mass = fuelmass+bodymass
		
		
		
		if engine == true:
			velocity += (thrust/mass) * delta
	
		velocity+= acceleration * delta
		
		
		position.y+=velocity *delta 


func _on_button_button_down() -> void:
	launch = true
	engine = true
