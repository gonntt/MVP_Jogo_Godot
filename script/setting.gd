extends Control

var master_bus = AudioServer.get_bus_index("Master")


@onready var h_slider = get_node("MarginContainer/HSlider")
func _ready():
	
	AudioServer.set_bus_volume_db(master_bus, Global.volume)
	if Global.volume == 0:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
	
	# 
	h_slider.value = Global.volume

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_full_screen_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_h_slider_value_changed(value):
	Global.volume = value  
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == 0:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
