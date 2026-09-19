extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity := 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ysp+=gravity
	xsp=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))
	velocity = Vector2(xsp,ysp)
	move_and_slide()
	
