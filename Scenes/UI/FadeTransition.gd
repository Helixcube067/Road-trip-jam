extends SceneHelper
class_name FadeTransition

func _ready():
	%AnimationPlayer.play("Fade in")
	await %AnimationPlayer.animation_finished
	
func Fadeout():
	%AnimationPlayer.play("Fade out")
	await %AnimationPlayer.animation_finished
	
func FadeHelper(destination):
	Fadeout()
	get_tree().change_scene_to_file(destination)

func FadeScene(destination):
	call_deferred("FadeHelper", destination)
