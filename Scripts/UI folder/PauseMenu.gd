extends SceneHelper

func _input(_event):
	if(StateMachine.CheckState(StateMachine.States.IDLE)):
		if(Input.is_action_pressed("Escape")):
			%CanvasLayer.show();
			StateMachine.ChangeState(StateMachine.States.UINAVINGATION);
	
func _on_continue_button_pressed():
	%CanvasLayer.hide();
	StateMachine.ChangeState(StateMachine.States.IDLE);

func _on_stats_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	quitGame();
