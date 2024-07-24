extends Sprite2D


@onready var animation_player = get_node("Marker2D/anim_player")

func _process(delta):
	if Input.is_action_pressed("skill1"):
		play_animation("water")
	elif Input.is_action_pressed("skill2"):
		play_animation("fire")
	elif Input.is_action_pressed("skill3"):
		play_animation("vento")
	elif Input.is_action_pressed("skill4"):
		play_animation("raio")
	elif Input.is_action_pressed("skill5"):
		play_animation("terra")
	else:
		play_animation("idle")

func play_animation(animation_name):
	if animation_player.current_animation != animation_name:
		animation_player.play(animation_name)


func _on_area_2d_body_entered(body):
	animation_player.play("morte_play")
	call_deferred("_deferred_change_scene_and_free")
func _deferred_change_scene_and_free():
	get_tree().change_scene_to_file("res://scenes/morte.tscn")
	queue_free()
