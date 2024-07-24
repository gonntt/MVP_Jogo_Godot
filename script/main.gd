extends Node

var animation_players = []
var animation_names = []
var current_animation_index = 0
var character : Sprite2D
var initial_position : Vector2
var target_position : Vector2
var move_distance : float = 145


func _ready():
	animator.connect("animation_finished", Callable(self, "_on_animation_finished"))
	character = get_node("Background/Player")
	initial_position = character.position
	target_position = initial_position - Vector2(0, move_distance)

   
	animation_players = [
		$Anim1,
		$Anim2,
		$Anim3
	]
	
	animation_names = [
		"fluxo",
		"fluxo2",
		"fluxo3"
	]
	
	
	for player in animation_players:
		player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_players[current_animation_index].play(animation_names[current_animation_index])
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		character.position = target_position
	elif Input.is_action_just_pressed("ui_down"):
		character.position = initial_position


var agua = preload("res://cenas/agua.tscn")
var fogo = preload("res://cenas/fogo.tscn")
var terra = preload("res://cenas/terra.tscn")
var ar = preload("res://cenas/ar.tscn")
var raio = preload("res://cenas/raio.tscn")

var pressed_button = null
var instance_to_create = null

@onready var animator = get_node("Background/Player/Marker2D/anim_player")
@onready var projett = get_node("Background/Player/Marker2D")
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
	current_animation_index = (current_animation_index + 1) % animation_players.size()
	animation_players[current_animation_index].play(animation_names[current_animation_index])
	if anim_name == "water" and pressed_button == "skill1":
		var instancia_agua = instance_to_create.instantiate()
		instancia_agua.position = projett.global_position 
		instancia_agua.spawn(300, Vector2(1, 0), "Agua")
		add_child(instancia_agua)
	elif anim_name == "fire" and pressed_button == "skill2":
		var instancia_fogo = instance_to_create.instantiate()
		instancia_fogo.position = projett.global_position
		instancia_fogo.spawn(300, Vector2(1, 0), "Fogo")
		add_child(instancia_fogo)
	elif anim_name == "terra" and pressed_button == "skill5":
		var instancia_terra = instance_to_create.instantiate()
		instancia_terra.position = projett.global_position
		instancia_terra.spawn(300, Vector2(1, 0), "Terra")
		add_child(instancia_terra)
	elif anim_name == "vento" and pressed_button == "skill3":
		var instancia_ar = instance_to_create.instantiate()
		instancia_ar.position = projett.global_position
		instancia_ar.spawn(300, Vector2(1, 0), "Ar")
		add_child(instancia_ar)
	elif anim_name == "raio" and pressed_button == "skill4":
		var instancia_raio = instance_to_create.instantiate()
		instancia_raio.position = projett.global_position
		instancia_raio.spawn(300, Vector2(1, 0), "Raio")
		add_child(instancia_raio)
	
	
	pressed_button = null
	instance_to_create = null



