extends Node
class_name SceneHelper

#TODO also look into how we did scene switching for keeping positions
@export var switchTo : String
@export var loadScreen : loadingScreen

func changeScene(destination):
	assert(loadScreen != null)
	loadScreen.path = destination;
	loadScreen.currentlyLoading = true
	
func switchUI(activeNode : Node, inactiveNode : Node):
	activeNode.visible = false;
	inactiveNode.visible = true;
	
func quitGame():
	get_tree().quit()
