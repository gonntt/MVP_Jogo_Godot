extends Marker2D


@export var spawn_min_intervalo:float = 2
@export var spawn_max_intervalo:float = 3
@export var tipos_obstaculos: Array[PackedScene] = []
@onready var collision_shape_2d 

func _ready():
	spawn()

func spawn():
	var obstaculos = tipos_obstaculos.pick_random()
	var obstaculos_instaciados = obstaculos.instantiate()

	add_child(obstaculos_instaciados)
	
	get_tree().create_timer(randf_range(spawn_min_intervalo, spawn_max_intervalo)).timeout.connect(spawn)
