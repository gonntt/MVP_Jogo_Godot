class_name Obstaculo
extends StaticBody2D

var neutraliza_elementos:Array = []
@export var speed = 500
const DIRECTION = Vector2.LEFT
var speedd: float
var direction: Vector2
var elemento: String

func eh_neutralizado_por(elemento: String) -> bool:
	return elemento in neutraliza_elementos


func _physics_process(delta):
	position += DIRECTION * speed * delta
	
func spawn(_speed: float, _direction: Vector2, _elemento: String):
	speedd = _speed
	direction = _direction
	elemento = _elemento


