extends VehicleBody3D
var steer : float = 0.6
var speed : float = 600
@onready var back_left: VehicleWheel3D = $Back_Left
@onready var back_right: VehicleWheel3D = $Back_Right
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var turn_input = Input.get_axis("Right","Left")
	steering = move_toward(steering, turn_input * steer , delta * 2.5)
	var acceleration = Input.get_action_strength("Accelerate")
	var backward = Input.get_action_strength("Decelerate")
	engine_force = speed * (acceleration - backward)
	if Input.is_action_pressed("Handbrake"):
		brake = 5
		back_left.wheel_friction_slip = 0.5
		back_right.wheel_friction_slip = 0.5
		engine_force = speed*1.2
	
	else:
		brake = 0
		back_left.wheel_friction_slip = 10
		back_right.wheel_friction_slip = 10
		
