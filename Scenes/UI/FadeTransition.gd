extends CanvasLayer
#TODO Need to connect the signal for the fade in and out
@export var sceneManager : Node
var playerHolder

func _ready():
	get_tree().get_first_node_in_group("Player").Transitioned.connect(Transition)
	sceneManager.Transitioned.connect(Transition)
	
func Transition(animName : String):
	print(animName)
	if(animName == "FadeOut"):
		%AnimationPlayer.play("Fade out")
	elif(animName == "FadeIn"):
		%AnimationPlayer.play("Fade in")
