extends Control


# 
func _ready():
	var animation_player = get_node("MarginContainer/HBoxContainer/anim")
	if animation_player:
		animation_player.play("init_anim")
	else:
		print("AnimationPlayer não encontrado!")




func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_setting_pressed():
	get_tree().change_scene_to_file("res://scenes/setting.tscn")


func _on_quit_pressed():
	get_tree().quit()
