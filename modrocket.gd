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

var light 
var particles  

signal newvelocity
signal newacceleration
signal newmass
signal newheight


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
	pass
	
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
	

	
