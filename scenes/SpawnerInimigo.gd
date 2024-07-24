extends Marker2D


@export var spawn_min_intervalo:float = 20
@export var spawn_max_intervalo:float = 30
@export var tipos_inimigos: Array[PackedScene] = []
@onready var collision_shape_2d 

func _ready():
	spawn()

func spawn():
	var obstaculos = tipos_inimigos.pick_random()
	var obstaculos_instaciados = obstaculos.instantiate()
	add_child(obstaculos_instaciados)
	get_tree().create_timer(randf_range(spawn_min_intervalo, spawn_max_intervalo)).timeout.connect(spawn)
