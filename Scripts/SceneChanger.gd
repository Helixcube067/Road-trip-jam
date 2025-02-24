extends Node
class_name SceneHelper

#TODO also look into how we did scene switching for keeping positions
@export var switchTo : String

func changeScene(destination):
	get_tree().change_scene_to_file(destination);
	
func switchUI(activeNode : Node, inactiveNode : Node):
	activeNode.visible = false;
	inactiveNode.visible = true;
	
func quitGame():
	get_tree().quit()
