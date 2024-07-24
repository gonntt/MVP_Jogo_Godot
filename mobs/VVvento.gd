extends Marker2D

@onready var animation_player = $AnimationPlayer
@onready var timer = Timer.new()

var idle_animation = "idle"
var projetil_animation = "projetil"
var min_interval = 20.0 
var max_interval = 27.0 

var vento = preload("res://cenas_bb/furacao.tscn")

var instance_to_create = null

func _ready():
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	play_animation(idle_animation)
	start_next_animation()

func play_animation(animation_name):
	if animation_player.current_animation != animation_name:
		animation_player.play(animation_name)

func start_next_animation():
	var interval = rand_range(min_interval, max_interval)
	timer.start(interval)

func _on_timer_timeout():
	instance_to_create = vento
	play_animation(projetil_animation)
	timer.stop()  

func _on_animation_finished(anim_name):
	if anim_name == projetil_animation:
		if instance_to_create:
			var instance = instance_to_create.instantiate()
			instance.spawn(300, Vector2(-3, 0), "Vento")
			add_child(instance)
			instance_to_create = null
		timer.start(rand_range(min_interval, max_interval))  
		play_animation(idle_animation)
func rand_range(min, max):
	return min + randf() * (max - min)
