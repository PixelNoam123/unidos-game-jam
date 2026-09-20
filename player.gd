extends CharacterBody2D
var xsp :float = 0
var ysp :float = 0
var gravity :=  2500
var speed :float = 100
var jump_power :float = 1000
var can_get_jump_power :bool = true
var friction :float = 0.7
var last_x:float
var texture=load("res://glibby-0003.png")
var sweet_color=Color.from_rgba8(174,101,151)
var sour_color=Color.from_rgba8(182,176,57)
var half_width = DisplayServer.window_get_size().x / 2.0
var tilemap_x = 0
var spawnVector = Vector2(400,200)


func set_glibby_color():
	var avg_red = (sweet_color.r*PlayerVariables.sweet_prec) + (sour_color.r*PlayerVariables.sour_prec)
	var avg_green = (sweet_color.g*PlayerVariables.sweet_prec) + (sour_color.g*PlayerVariables.sour_prec)
	var avg_blue = (sweet_color.b*PlayerVariables.sweet_prec) + (sour_color.b*PlayerVariables.sour_prec)
	var main_color = Color(avg_red,avg_green,avg_blue)
	var shadow_color = Color(avg_red-40,avg_green-40,avg_blue-40)
	var img: Image = texture.get_image()
	for y in range(img.get_height()):
		for x in range(img.get_width()):
			if img.get_pixel(x,y)==Color.from_rgba8(216,216,216):
				img.set_pixel(x,y,main_color)
			if img.get_pixel(x,y)==Color.from_rgba8(149,149,149):
				img.set_pixel(x,y,shadow_color)
	$Sprite2D.texture=ImageTexture.create_from_image(img)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = spawnVector
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_glibby_color()
	#if one floor all the jumping things reset
	if is_on_floor():
		ysp=-ysp * PlayerVariables.spicy_prec / 1.2
		if Input.is_action_pressed("jump"):
			ysp = -(jump_power * (PlayerVariables.sour_prec / 2) + 200)
	if is_on_ceiling():
		ysp=-ysp * PlayerVariables.spicy_prec / 1.2
	#as long as you keep holding jump and you dont reach the limit the jump power keeps getting apllied
	
		
	#applies gravity
	ysp+=gravity * delta * (PlayerVariables.umame_prec / 2) + 10
	#calculates x movement
	xsp+=(int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left")))*(speed * PlayerVariables.sweet_prec + 30)
	xsp*= friction
	#godot defult characterbody2d velocity - applies delta automaticly and doesnt let the player go through staticbody2d nodes
	velocity = Vector2(xsp,ysp)
	move_and_slide()
	
	if position.x > half_width:
		tilemap_x -= position.x - half_width
		position.x = half_width
	
	if position.x < half_width / 3:
		tilemap_x -= position.x - half_width / 3
		position.x = half_width / 3
	
	$"../TileMapLayer".position.x = tilemap_x
	
		
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is $"../TileMapLayer":
		var tile_data = body.get_cell_tile_data(body.local_to_map(body.to_local(position)))
		if tile_data and tile_data.get_custom_data("is_dangerous"):
			tilemap_x = 0
			position = spawnVector
