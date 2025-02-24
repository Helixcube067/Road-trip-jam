extends SceneHelper

#HACK Need to make a state machine to dictate what the player can cannot do
func _process(_delta):
	if(Input.is_action_pressed("Escape")):
		%CanvasLayer.show();
	pass;
	
func _on_continue_button_pressed():
	%CanvasLayer.hide();

func _on_stats_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	quitGame();
