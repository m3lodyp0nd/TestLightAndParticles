extends KinematicBody2D

const GRAVITY = 20
const SPEED = 110
const JUMP_FORCE = -400


var motion = Vector2()
var speed = 200

onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer

# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y += GRAVITY
	
	motion.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * SPEED
	
	if is_on_floor() and Input.is_action_pressed("jump"):
		motion.y = JUMP_FORCE
		animation_player.play("jump")
		
	if motion.x < 0:
		sprite.flip_h = true
		animation_player.play("run")
	elif motion.x > 0:
		sprite.flip_h = false
		animation_player.play("run")
	else:
		animation_player.play("idle")
	motion = move_and_slide(motion, Vector2.UP)
	
	pass


# warning-ignore:unused_argument
func _on_Hurtbox_area_entered(area):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://lose.tscn")
