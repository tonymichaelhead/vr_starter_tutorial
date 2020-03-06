#extends Spatial
#
#func _ready():
#	var VR = ARVRServer.find_interface("OpenVR")
#	if VR and VR.initialize():
#		get_viewport().arvr = true
#		get_viewport().hdr = false
#
#		OS.vsync_enabled = false
#		Engine.target_fps = 90
		

#extends Spatial
#
#func _ready():
#	var interface = ARVRServer.find_interface('OVRMobile')
#	if interface and interface.initialize():
#		get_viewport().arvr = true
#
#		get_viewport().hdr = false # This line
#
#		OS.vsync_enabled = false # this line from above


extends Spatial

onready var ovr_init_config = preload("res://addons/godot_ovrmobile/OvrInitConfig.gdns").new()
onready var ovr_performance = preload("res://addons/godot_ovrmobile/OvrPerformance.gdns").new()

var perform_runtime_config = false

var spheres_left = 10
var sphere_ui = null

func _ready():
	var interface = ARVRServer.find_interface("OVRMobile")
	if interface:
		ovr_init_config.set_render_target_size_multiplier(1)

		if interface.initialize():
			get_viewport().arvr = true

func _process(_delta):
	if !perform_runtime_config:
		ovr_performance.set_clock_levels(1, 1)
		ovr_performance.set_extra_latency_mode(1)
		perform_runtime_config = true
		

func remove_sphere():
	spheres_left -= 1
	
	if sphere_ui:
		sphere_ui.update(spheres_left)