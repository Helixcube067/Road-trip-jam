extends Node
class_name dialogueHolder

@export_group("Holder adjustments")
@export var dictKey : String
@export var playOnEnter : bool = false
@export var battleAfter : bool = false
@export_group("Dialogue assembly")
@export var lineCount : int
@export_multiline var lines : Array[String]
@export var speakers : Array[String] 
@export var textures : Array[Texture2D]
var inRange : bool = false

signal dialogueTriggered(dialogue : dialogueHolder)

func _ready():
	add_to_group("DialoguePoints")
	
func QualityControl():
	assert(lineCount != null, "You forgot to define the line count");
	assert(lineCount == lines.size(), "Check the array sizes");
	assert(lineCount == speakers.size(), "Check the array sizes");
	assert(lineCount == textures.size(), "Check the array sizes");
	#if(lineCount == null):
		#return false
	#elif((lineCount-1) != lines.size()):
		#return false
	#elif((lineCount-1) != speakers.size()):
		#return false
	#elif((lineCount-1) != textures.size()):
		#return false
	#else:
		#return true

func _on_body_entered(body):
	if(body == get_tree().get_first_node_in_group("Player")):
		if(playOnEnter):
			if(DialogueCutsceneHelper.cutsceneDict.has(dictKey) == false):
				if(StateMachine.CheckState(StateMachine.States.IDLE) && 
				!StateMachine.CheckState(StateMachine.States.CONVERSATING)):
					emit_signal("dialogueTriggered", self)
					DialogueCutsceneHelper.cutsceneDict[dictKey] = true
		else:
			inRange = true;
			%ExclamationPoint.show()
		
func _on_body_exited(body):
	if(body == get_tree().get_first_node_in_group("Player")):
		inRange = false;
		%ExclamationPoint.hide()
		
func _input(_event):
	if(Input.is_action_pressed("Interact")):
		if(inRange):
			if(StateMachine.CheckState(StateMachine.States.IDLE) && 
			!StateMachine.CheckState(StateMachine.States.CONVERSATING)):
				emit_signal("dialogueTriggered", self)
