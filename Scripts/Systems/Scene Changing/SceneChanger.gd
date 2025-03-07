extends Node
class_name SceneHelper

#TODO also look into how we did scene switching for keeping positions
@export var switchTo : String
@export var loadScreen : loadingScreen
signal Transitioned(animName : String)

func _ready():
	Transitioned.connect(Test)

func changeScene(destination):
	assert(loadScreen != null)
	loadScreen.path = destination;
	loadScreen.currentlyLoading = true

func FadeScene(destination):
	call_deferred("FadeHelper", destination)
	
func switchUI(activeNode : Node, inactiveNode : Node):
	activeNode.visible = false;
	inactiveNode.visible = true;
	
func quitGame():
	get_tree().quit()
	
func FadeHelper(destination):
	get_tree().change_scene_to_file(destination)
	emit_signal("Transitioned", "FadeIn")
	
func Test(string):
	print(string)
