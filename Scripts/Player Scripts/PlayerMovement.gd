extends CharacterBody2D

@export var speed : float = 50;
var door
signal Transitioned(animName : String)
# HACK Heres a slight bug here for checking the moving state. Might remove it with this iteration
#this is to check if the player was traveling and if they were teleport them into the right location
func _ready():
	if(SceneChangeHelper.traveling):
		door = get_tree().current_scene.find_child(SceneChangeHelper.doorPath).find_child("Destination")
		assert(door != null)
		position = door.position
		SceneChangeHelper.traveling = false
		emit_signal("Transitioned", "FadeOut")
		
func _physics_process(_delta):
	if(StateMachine.CheckState(StateMachine.States.IDLE)):
		#StateMachine.ChangeState(StateMachine.States.MOVING);
		var playerInput = Input.get_vector("Left button", "Right button", "Up button", "Down button");
		velocity = playerInput * speed;
		move_and_slide();
	#else:
		#StateMachine.ChangeState(StateMachine.States.IDLE);
