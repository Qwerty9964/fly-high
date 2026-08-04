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

var light 
var particles  

signal newvelocity
signal newacceleration
signal newmass
signal newheight


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light = $enginelight
	particles = $particles


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	newheight.emit(position.y)
	
	if launch == true:
		acceleration=0
		acceleration-=gravity
		 
		fuelmass-= 0.01 *delta
		mass = fuelmass+bodymass
		
		
		if engine and fuelmass>=0:
			acceleration += (thrust/mass) 
		else:
			fuelmass=0
			engine=false
			particles.emitting = false
			light.light_energy = 0
			
	
		velocity+= acceleration * delta
		
		position.y+=velocity *delta 
		
		newacceleration.emit(acceleration)
		newmass.emit(mass)
		newvelocity.emit(velocity)
		
