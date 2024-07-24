extends VideoStreamPlayer


func _ready():
	self.connect("finished", Callable(self, "_on_VideoPlayer_finished"))
	self.play()

func _on_VideoPlayer_finished():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

