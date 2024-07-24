class_name Projetil
extends Area2D

var speed: float
var direction: Vector2
var elemento: String

func _physics_process(delta):
	position += direction * speed * delta

func spawn(_speed: float, _direction: Vector2, _elemento: String):
	speed = _speed
	direction = _direction
	elemento = _elemento


func _on_body_entered(body): 
	if body.has_method("eh_neutralizado_por"):
		if body.eh_neutralizado_por(elemento):
			body.queue_free()
	queue_free()	
	
