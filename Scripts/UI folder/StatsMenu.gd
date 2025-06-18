extends SceneHelper

# TODO: do something for the equipment names and expand the panel
func _on_matthew_button_pressed():
	%"Stats container".visible = true
	MattStatsUpdate()
	
func _on_andrew_button_pressed():
	%"Stats container".visible = true
	AndrewStatsUpdate()

func MattStatsUpdate():
	%Icon.texture = PartyInfo.mattStats.icon
	%"Atk label".text = "ATK: " + str(PartyInfo.mattStats.equippedWeapon.attack)
	%"Def label".text = "DEF" + str(PartyInfo.mattStats.equippedArmor.defense)
	%"Name label".text = "Name: " + str(PartyInfo.mattStats.unitName)
	%"Lvl label".text = "Lvl: " + str(PartyInfo.mattStats.level)
	%"Exp label".text = "Exp: " + str(PartyInfo.mattStats.currentExp) + "/" + str(PartyInfo.mattStats.expNeededToLevel)
	%"HP label".text = "HP: " + str(PartyInfo.mattStats.currentHP) + "/" + str(PartyInfo.mattStats.maxHP)
	%"MP label".text = "MP: " + str(PartyInfo.mattStats.currentMP) + "/" + str(PartyInfo.mattStats.maxMP)
	%"Strength label".text = "Strength: " + str(PartyInfo.mattStats.strength)
	%"Endurance label".text = "Endurance: " + str(PartyInfo.mattStats.vitality)
	%"Dexterity label".text = "Dexterity: " + str(PartyInfo.mattStats.dexterity)
	%Speed.text = "Speed: " + str(PartyInfo.mattStats.speed)

func AndrewStatsUpdate():
	%Icon.texture = PartyInfo.andrewStats.icon
	%"Atk label".text = "ATK: " + str(PartyInfo.andrewStats.equippedWeapon.attack)
	%"Def label".text = "DEF" + str(PartyInfo.andrewStats.equippedArmor.defense)
	%"Name label".text = "Name: " + str(PartyInfo.andrewStats.unitName)
	%"Lvl label".text = "Lvl: " + str(PartyInfo.andrewStats.level)
	%"Exp label".text = "Exp: " + str(PartyInfo.andrewStats.currentExp) + "/" + str(PartyInfo.andrewStats.expNeededToLevel)
	%"HP label".text = "HP: " + str(PartyInfo.andrewStats.currentHP) + "/" + str(PartyInfo.andrewStats.maxHP)
	%"MP label".text = "MP: " + str(PartyInfo.andrewStats.currentMP) + "/" + str(PartyInfo.andrewStats.maxMP)
	%"Strength label".text = "Strength: " + str(PartyInfo.andrewStats.strength)
	%"Endurance label".text = "Endurance: " + str(PartyInfo.andrewStats.vitality)
	%"Dexterity label".text = "Dexterity: " + str(PartyInfo.andrewStats.dexterity)
	%Speed.text = "Speed: " + str(PartyInfo.andrewStats.speed)

func _on_stats_container_visibility_changed():
	if PartyInfo.party.has("Andrew") != true:
		%AndrewButton.visible = false
	else:
		%AndrewButton.visible = true
	
