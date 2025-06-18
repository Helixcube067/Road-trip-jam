extends Control
var waitCheck
var dialoguePoints : Array

#need to pass in multiple things per dialogue so per dialogue it would have to be 1 speaker, 1 image, and 1 line of dialogue
#godot doesnt allow multi dimensional arrays
#dictionary isnt good because its key value and isnt loopable(?)
#Temp solution: 3 arrays that carry the information and just keep track of all 3
#note: VERY unsafe because in the event any of these get out of sync a lot of issues pop up.
func _ready():
	dialoguePoints = get_tree().get_nodes_in_group("DialoguePoints")
	for i in range(dialoguePoints.size()):
		dialoguePoints[i].dialogueTriggered.connect(DialogueSignalHelper)

func StartDialogue(dialogue : dialogueHolder):
	dialogue.QualityControl();
	StateMachine.ChangeState(StateMachine.States.CONVERSATING)
	%CanvasLayer.show()
	for i in range(dialogue.lineCount):
		%"Speaker name".text = dialogue.speakers[i];
		%"Dialogue Text".text = dialogue.lines[i];
		%Portrait.texture = dialogue.textures[i];
		%AnimationPlayer.play("TypeWriterEffect");
		waitCheck = await %"Continue button".pressed
		#waitCheck = await Input.is_action_pressed("Interact")
	%CanvasLayer.hide();
	if(dialogue.battleAfter):
		print("Proceed to battle")
		StateMachine.ChangeState(StateMachine.States.COMBAT)
	else:
		StateMachine.ChangeState(StateMachine.States.IDLE)
	
func DialogueSignalHelper(thing : dialogueHolder):
	StartDialogue(thing)
