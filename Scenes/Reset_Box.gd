extends RigidBody


var start_transform

var reset_timer = 0
const RESET_TIME = 120


func _ready():
	start_transform = global_transform


func _physics_process(delta):
	reset_timer += delta
	if reset_timer >= RESET_TIME:
		global_transform = start_transform
		reset_timer = 0


# Called when interact button is pressed while the object is held
func interact():
	get_tree().change_scene("res://Game.tscn")


# Called when the object is picked up
func picked_up():
	pass


# Called when the object is dropped
func dropped():
	global_transform = start_transform
	reset_timer = 0
