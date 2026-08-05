extends Node3D

var velocity = 0
var launch = false
var engine_on = false
var gravity = 9.81
var acceleration = 0
var bodymass=0
var fuelmass=0
var mass = 0
var thrust= 0
var fuelburnrate = 0
var og_mass
var og_fuelmass

var light 
var particles  

signal newvelocity
signal newacceleration
signal newmass
signal newheight
signal fuelleft


@export var engine: engine_module
@export var fuel_tank: fuel_tank_module
@export var body: body_module
@export var nosecone: nosecone_module

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modules_initiate()
	modules_configure()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	newheight.emit(position.y)
	newacceleration.emit(acceleration)
	newmass.emit(mass)
	newvelocity.emit(velocity)
	fuelleft.emit(fuelmass/og_fuelmass*100)
	
	if launch == true:
		acceleration=0
		acceleration-=gravity
		 
		fuelmass-= fuelburnrate*delta
		mass=fuelmass+og_mass
	
		if engine and fuelmass>=0:
			acceleration += (thrust/mass) 
		else:
			fuelmass=0
			engine_on=false
	
		velocity+= acceleration * delta
		
		position.y+=velocity *delta 
		
		
	
	
#helpers
	
func modules_initiate() -> void:
	var engine_instance=engine.module_scene.instantiate()
	$engineslot.add_child(engine_instance)
	
	var fuel_tank_instance=fuel_tank.module_scene.instantiate()
	$fueltankslot.add_child(fuel_tank_instance)
	
	var body_instance=body.module_scene.instantiate()
	$bodyslot.add_child(body_instance)
	
	var nosecone_instance=nosecone.module_scene.instantiate()
	$noseconeslot.add_child(nosecone_instance)
	
	$fueltankslot.position.y=engine.height
	$bodyslot.position.y=fuel_tank.height+engine.height
	$noseconeslot.position.y=body.height+fuel_tank.height+engine.height

func modules_configure() -> void:
	mass=engine.mass+fuel_tank.mass+body.mass+nosecone.mass
	thrust=engine.thrust
	fuelburnrate=engine.fuel_burn_rate
	fuelmass=fuel_tank.fuel_capacity*0.1
	og_mass=mass
	og_fuelmass=fuelmass
	


func _on_button_button_down() -> void:
	launch=true
	engine_on=true
	
