extends Area2D
@export var playOnStart : bool
@export var hasDialogue : bool
@export var animationNames : Array[String]
@export var dictKey : String
@export var dialogue : Array[dialogueHolder]

func _ready():
	if(DialogueCutsceneHelper.cutsceneDict.has(dictKey) == false):
		if(playOnStart):
			DetermineDialogueType()
			
func _on_body_entered(body):
	if(body == get_tree().get_first_node_in_group("Player")):
		DetermineDialogueType()

func DetermineDialogueType():
	if(DialogueCutsceneHelper.cutsceneDict.has(dictKey) == false):
		if(hasDialogue):
			DialogueCutScene()
		else:
			NonDialogueCutScene()
		
func NonDialogueCutScene():
	for i in range(animationNames.size()):
		%AnimationPlayer.play(animationNames[i])
		await %AnimationPlayer.animation_finished
	DialogueCutsceneHelper.cutsceneDict[dictKey] = true
	
func DialogueCutScene():
	for i in range(animationNames.size()):
		%AnimationPlayer.play(animationNames[i])
		await %AnimationPlayer.animation_finished
		if(dialogue.size() >= i):
			dialogue[i].emit_signal("dialogueTriggered", dialogue[i])
	DialogueCutsceneHelper.cutsceneDict[dictKey] = true
