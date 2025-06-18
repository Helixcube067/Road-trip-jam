extends Node

# NOTE: .duplicate() for monsters
var mattStats : PartyMember
var andrewStats : PartyMember
var party = {}
func _ready():
	#if a save doesnt exist
	mattStats = preload("res://Scripts/Entities/Matthew.tres")
	party["Matthew"] = mattStats
	pass
