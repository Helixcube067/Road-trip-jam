extends Control
@export var ex : dialogueHolder
var waiting
#TODO need to make a signal for dialogue. Also need to test this on things in the map because theres no way to proc it right now
#need to pass in multiple things per dialogue so per dialogue it would have to be 1 speaker, 1 image, and 1 line of dialogue
#godot doesnt allow multi dimensional arrays
#dictionary isnt good because its key value and isnt loopable(?)
#Temp solution: 3 arrays that carry the information and just keep track of all 3
#note: VERY unsafe because in the event any of these get out of sync a lot of issues pop up.

func _physics_process(_delta):
	if(Input.is_action_pressed("Interact")):
		ex.QualityControl();
		StartDialogue(ex);

func StartDialogue(dialogue : dialogueHolder):
	%CanvasLayer.show()
	for i in range(dialogue.lineCount):
		%"Speaker name".text = dialogue.speakers[i];
		%"Dialogue Text".text = dialogue.lines[i];
		%Portrait.texture = dialogue.textures[i];
		%AnimationPlayer.play("TypeWriterEffect");
		waiting = await %"Continue button".pressed
	%CanvasLayer.hide();
