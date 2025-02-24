extends Node
class_name dialogueHolder

@export_group("Dialogue assembly")
@export var lineCount : int
@export var lines : Array[String]
@export var speakers : Array[String] 
@export var textures : Array[Texture2D]

func QualityControl():

	assert(lineCount != null, "You forgot to define the line count");
	assert(lineCount == lines.size(), "Check the array sizes");
	assert(lineCount == speakers.size(), "Check the array sizes");
	assert(lineCount == textures.size(), "Check the array sizes");
	#if(lineCount == null):
		#return false
	#elif((lineCount-1) != lines.size()):
		#return false
	#elif((lineCount-1) != speakers.size()):
		#return false
	#elif((lineCount-1) != textures.size()):
		#return false
	#else:
		#return true
