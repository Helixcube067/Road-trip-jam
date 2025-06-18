extends Resource
class_name Entity

@export var icon : Texture2D
@export_group("General Stats")
@export var unitName : String
@export var level : int
@export var maxHP : int
@export var currentHP : int
@export var strength : int
@export var vitality : int
@export var dexterity : int
@export var speed : int
@export var isDead : bool = false

#move this into the gear system
@export_group("Affinities")
@export var slashAffinity : float = 1.0
@export var bluntAffinity : float = 1.0
@export var pierceAffinity : float = 1.0

#make a list of ints here and that checks when you should learn the level of a skill.
#alternatively could move that into the skill list
@export var skillList : Array[skills]

func TakeDamage(amount : int):
	if(amount >= currentHP):
		currentHP = 0
		isDead = true
	else:
		currentHP -= amount

func CalculateDamage(incomingDamage : skills):
	match(incomingDamage.TYPE):
		"Blunt":
			TakeDamage(floor(incomingDamage.damage - (floor(vitality / 2)) * bluntAffinity))
		"Pierce":
			TakeDamage(floor(incomingDamage.damage - (floor(vitality / 2)) * pierceAffinity))
		"Slash":
			TakeDamage(floor(incomingDamage.damage - (floor(vitality / 2)) * slashAffinity))

func HealDamage(amount : int):
	if(amount <= currentHP):
		currentHP = maxHP
	else:
		currentHP += amount
