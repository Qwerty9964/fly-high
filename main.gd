extends Node3D

@onready var accelerationlab = $ui/flight/accelerationlab
@onready var velocitylab = $ui/flight/velocitylab
@onready var masslab = $ui/flight/masslab
@onready var heightlab =$ui/flight/heightlab
@onready var fuelleftlab =$ui/flight/fuelleftlab


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$modrocket.newvelocity.connect(_on_newvelocity)
	$modrocket.newacceleration.connect(_on_newacceleration)
	$modrocket.newmass.connect(_on_newmass)
	$modrocket.newheight.connect(_on_newheight)
	$modrocket.fuelleft.connect(_on_newfuelleft)


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
	
func _on_newfuelleft(fuel):
	fuelleftlab.text = "FUEL REMAINING: %.2f%%" % fuel
	

	
