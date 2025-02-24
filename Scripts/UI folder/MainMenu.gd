extends SceneHelper

func _on_play_button_pressed():
	changeScene(switchTo);

func _on_load_button_pressed():
	switchUI(%Buttons, %"Save System");

func _on_quit_button_pressed():
	quitGame();
	
func _on_back_button_pressed():
	switchUI(%"Save System", %Buttons);
