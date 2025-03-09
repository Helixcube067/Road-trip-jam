extends Node2D
class_name Door

#takes its own spawn and saves it. The destination and door both need to be manually set
@export var destinationLevel : String
@export var destinationDoor : String
@export var fader : FadeTransition
@onready var spawn = $Destination

func _on_body_entered(body):
	assert(destinationLevel != null)
	if(body == get_tree().get_first_node_in_group("Player")):
		if(!LocationHelper.traveling):
			LocationHelper.doorPath = destinationDoor
			LocationHelper.traveling = true
			fader.FadeScene(destinationLevel)
