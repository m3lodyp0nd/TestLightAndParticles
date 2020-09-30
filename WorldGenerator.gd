extends Position2D

export(PackedScene) var block

export(int) var grid_size

export(int) var buffer

var previous_action

onready var player = get_parent().get_node("Player")

signal instance_node(node, location)

func _ready():
	randomize()

# warning-ignore:unused_argument
func _process(delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
	if (global_position.x - player.global_position.x) * 0.1 <= 40:
		var action = round(rand_range(0, 20))
		
		if action != 0:
			if action > 0 and action < 6:
				global_position.y -= grid_size
			elif action > 6 and action < 12:
				global_position.y += grid_size
				
			global_position.x += grid_size
			emit_signal("instance_node", block, global_position)
		elif action == 0 and previous_action != 0:
			global_position.x += grid_size * 3
			
		previous_action = action
