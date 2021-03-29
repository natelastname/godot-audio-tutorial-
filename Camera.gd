extends Camera

onready var cube = $"/root/Spatial/cube"

var rmb_audio = preload("res://sounds/deagle.wav")
var lmb_audio = preload("res://sounds/pdudegun.wav")


var sound_3d = preload("res://audio/sound3d.tscn")
var sound_direct = preload("res://audio/sound_direct.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("lmb"):
		cube.apply_central_impulse(Vector3(0,4,0))
		var sound = sound_direct.instance()
		add_child(sound)
		sound.play_sound(lmb_audio)

	if Input.is_action_just_pressed("rmb"):
		var sound = sound_3d.instance()
		cube.add_child(sound)
		sound.play_sound(rmb_audio)

	self.look_at_from_position(global_transform.origin, cube.global_transform.origin, Vector3.UP)
