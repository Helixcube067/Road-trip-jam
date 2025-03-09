extends Control
class_name loadingScreen

# TODO Loading screen unfinished
var progress : Array
@export var path : String
var currentlyLoading : bool = false
func _ready():
	ResourceLoader.load_threaded_request(path);

func _process(_delta):
	if(currentlyLoading):
		%CanvasLayer.show()
		ResourceLoader.load_threaded_get_status(path, progress)
		%"Percent loaded text".text = str(int(progress[0] * 100.0), "%")
		%"Load bar".value = progress[0]
		print("Load bar value: ", %"Load bar".value)
		print("Progress: ", str(int(progress[0] * 100.0), "%"))
		if(%"Load bar".value >= 1.0):
			print("done")
			currentlyLoading = false
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path))
