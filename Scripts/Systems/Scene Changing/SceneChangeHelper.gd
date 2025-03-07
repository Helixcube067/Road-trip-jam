extends SceneHelper

#has an internal traveling bool and door path used for determining the teleportation
var traveling : bool = false
var doorPath : String
##Needs a level, door, and spawn direction all as strings
func DoorEntered(destinationLevel : String, destinationDoor : String):
	#doorPath = "Doors/" + destinationDoor
	doorPath = destinationDoor
	traveling = true
	FadeScene(destinationLevel)
