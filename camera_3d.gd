extends Camera3D

var strength=5
var go = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(strength)
	if go==true:
		position.x+=(randf_range(-0.01,0.01)*strength)
		position.y+=(randf_range(-0.01,0.01)*strength)
		position.z+=(randf_range(-0.01,0.01)*strength)
	
	strength-=0.2*delta
	
	strength = max(strength, 0.5)
	

func _on_button_button_down() -> void:
	go = true
	
