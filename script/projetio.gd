extends Marker2D

var agua = preload("res://cenas/agua.tscn")
var fogo = preload("res://cenas/fogo.tscn")
var terra = preload("res://cenas/terra.tscn")
var ar = preload("res://cenas/ar.tscn")
var raio = preload("res://cenas/raio.tscn")

var pressed_button = null
var instance_to_create = null

@onready var animator = get_node("/Background/Player/Marker2D/anim_player")

func _ready():
	animator.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _input(event):
	if event.is_action_pressed("skill1"):
		pressed_button = "skill1"
		instance_to_create = agua
		animator.play("water")
		
	if event.is_action_pressed("skill2"):
		pressed_button = "skill2"
		instance_to_create = fogo
		animator.play("fire")
		
	if event.is_action_pressed("skill5"):
		pressed_button = "skill5"
		instance_to_create = terra
		animator.play("terra")
		
	if event.is_action_pressed("skill3"):
		pressed_button = "skill3"
		instance_to_create = ar
		animator.play("vento")
		
	if event.is_action_pressed("skill4"):
		pressed_button = "skill4"
		instance_to_create = raio
		animator.play("raio")

func _on_animation_finished(anim_name):
	if anim_name == "water" and pressed_button == "skill1":
		var instancia_agua = instance_to_create.instantiate()
		instancia_agua.spawn(300, Vector2(1, 0), "Agua")
		add_child(instancia_agua)
	elif anim_name == "fire" and pressed_button == "skill2":
		var instancia_fogo = instance_to_create.instantiate()
		instancia_fogo.spawn(300, Vector2(1, 0), "Fogo")
		add_child(instancia_fogo)
	elif anim_name == "terra" and pressed_button == "skill5":
		var instancia_terra = instance_to_create.instantiate()
		instancia_terra.spawn(300, Vector2(1, 0), "Terra")
		add_child(instancia_terra)
	elif anim_name == "vento" and pressed_button == "skill3":
		var instancia_ar = instance_to_create.instantiate()
		instancia_ar.spawn(300, Vector2(1, 0), "Ar")
		add_child(instancia_ar)
	elif anim_name == "raio" and pressed_button == "skill4":
		var instancia_raio = instance_to_create.instantiate()
		instancia_raio.spawn(300, Vector2(1, 0), "Raio")
		add_child(instancia_raio)
	
	
	pressed_button = null
	instance_to_create = null
