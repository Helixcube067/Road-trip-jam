extends SceneHelper

@export var overworldUI : Node
func _input(_event):
	if(StateMachine.CheckState(StateMachine.States.IDLE)):
		if(Input.is_action_pressed("Escape")):
			%CanvasLayer.show()
			overworldUI.visible = false
			StateMachine.ChangeState(StateMachine.States.UINAVINGATION);
	
func _on_continue_button_pressed():
	%CanvasLayer.hide();
	StateMachine.ChangeState(StateMachine.States.IDLE);

func _on_stats_button_pressed():
	%"Pause menu landing".visible = false
	%Stats.visible = true
	StatsScreenPrep()
	
func _on_quit_button_pressed():
	quitGame();

func _on_stats_back_button_pressed():
	%"Stats container".visible = false
	%Stats.visible = false
	%"Pause menu landing".visible = true

func StatsScreenPrep():
	if PartyInfo.party.has("Andrew") == true:
		AndrewStatsPrep()
	else:
		$"CanvasLayer/Stats/Character buttons/Andrew Container".visible = false
	MatthewStatsPrep()
	
func AndrewStatsPrep():
	%AndrewButton.icon = PartyInfo.andrewStats.icon
	%"Andrew hp text".text = "HP: " + str(PartyInfo.andrewStats.currentHP)
	%"Andrew HP slider".value = PartyInfo.andrewStats.currentHP
	%"Andrew HP slider".max_value = PartyInfo.andrewStats.maxHP
	%"Andrew mp text".text = "MP: " + str(PartyInfo.andrewStats.currentMP)
	%"Andrew MP slider".value = PartyInfo.andrewStats.currentMP
	%"Andrew MP slider".max_value = PartyInfo.andrewStats.maxMP
	
func MatthewStatsPrep():
	%MatthewButton.icon = PartyInfo.mattStats.icon
	%"Matthew hp text".text = "HP: " + str(PartyInfo.mattStats.currentHP)
	%"Matthew HP slider".value = PartyInfo.mattStats.currentHP
	%"Matthew HP slider".max_value = PartyInfo.mattStats.maxHP
	%"Matthew mp text".text = "MP: " + str(PartyInfo.mattStats.currentMP)
	%"Matthew MP slider".value = PartyInfo.mattStats.currentMP
	%"Matthew MP slider".max_value = PartyInfo.mattStats.maxMP
