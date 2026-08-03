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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modules_configure()
	
	var engine_instance=engine.module_scene.instantiate()
	$engineslot.add_child(engine_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func modules_configure() -> void:
	mass+=engine.mass
	
