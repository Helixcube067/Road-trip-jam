extends Node

@export var switchTo : String 
func _on_start_button_pressed():
	get_tree().change_scene_to_file(switchTo)

func _on_quit_button_pressed():
	get_tree().quit()
