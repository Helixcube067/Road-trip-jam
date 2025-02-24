extends CharacterBody2D
@export var speed : float = 50;
# HACK need a state machine to have this solidified

func _physics_process(_delta):
	var playerInput = Input.get_vector("Left button", "Right button", "Up button", "Down button");
	velocity = playerInput * speed;
	move_and_slide();
