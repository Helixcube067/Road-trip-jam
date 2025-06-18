extends Resource
class_name skills

@export var name : String
@export var damage : int
@export var hpCost : int
@export var mpCost : int
@export_enum("Blunt", "Pierce", "Slash") var TYPE : String
@export_enum("Str", "Dex") var SCALING : String
