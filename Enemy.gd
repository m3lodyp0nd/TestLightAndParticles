extends KinematicBody2D

const SPEED = 130
const ACCELERATION = 500

var motion = Vector2()
onready var player = get_parent().get_node("Player")

# warning-ignore:unused_argument
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	motion = motion.move_toward(direction * SPEED, ACCELERATION * delta)
	
	motion = move_and_slide(motion)
