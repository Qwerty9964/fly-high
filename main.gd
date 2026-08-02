extends Node3D

@onready var accelerationlab = $ui/accelerationlab
@onready var velocitylab = $ui/velocitylab
@onready var masslab = $ui/masslab
@onready var heightlab =$ui/heightlab

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rocket.newvelocity.connect(_on_newvelocity)
	$rocket.newacceleration.connect(_on_newacceleration)
	$rocket.newmass.connect(_on_newmass)
	$rocket.newheight.connect(_on_newheight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_newvelocity(velocity):
	velocitylab.text= "VELOCITY: %.2f m/s" % velocity
	
func _on_newacceleration(accel):
	accelerationlab.text= "ACCELERATION: %.2f m/s/s" % accel
	
func _on_newmass(mass):
	masslab.text= "MASS: %.2f kg" % mass
	
func _on_newheight(height):
	heightlab.text = "HEIGHT: %.2f m" % height
	

	
