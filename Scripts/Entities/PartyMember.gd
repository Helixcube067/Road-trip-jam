extends Entity
class_name PartyMember

@export var maxMP : int
@export var currentMP : int
@export var equippedWeapon : WeaponType
@export var equippedArmor : ArmorType
var currentExp : int
var expNeededToLevel : int = 20

func IncrementExpRequirement(currExp : int, nextLevel : int):
	expNeededToLevel = (currExp * (nextLevel ** 3)) / 5
