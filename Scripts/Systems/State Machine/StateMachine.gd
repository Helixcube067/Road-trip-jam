extends Node
#Touches dialogue manager and holder, pause menu, and player movement 
enum States {IDLE, MOVING, CONVERSATING, UINAVINGATION, COMBAT}
var currentState

func _ready():
	ChangeState(StateMachine.States.IDLE);
	
func CheckState(newState):
	if(currentState != newState):
		return false
	else:
		return true

func ChangeState(newState):
	currentState = newState
	#if(currentState == newState):
		#print("Successful", self.name)
	#else:
		#print("Unsuccessful")

func PrintState():
	match currentState:
		0:
			return "Idle"
		1:
			return "Moving"
		2:
			return "Conversating"
		3:
			return "UI Navigation"
