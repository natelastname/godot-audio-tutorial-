extends Camera

onready var cube = $"/root/Spatial/cube"
onready var stream_player = $"AudioStreamPlayer"

var audio_stream = preload("res://sounds/barrett.wav")

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
		sound.play_sound(audio_stream)

	if Input.is_action_just_pressed("rmb"):
		var sound = sound_3d.instance()
		cube.add_child(sound)
		sound.play_sound(audio_stream)

	if Input.is_action_just_pressed("space"):
		stream_player.play()


	self.look_at_from_position(global_transform.origin, cube.global_transform.origin, Vector3.UP)
