extends VehicleBody3D
var steer : float = 1.0
var speed : float = 600
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var turn_input = Input.get_axis("Right","Left")
	steering = move_toward(steering, turn_input * steer , delta * 2.5)
	var acceleration = Input.get_action_strength("Accelerate")
	engine_force = speed * acceleration
