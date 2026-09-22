extends Control
var taste_list :=[]
var visible_sweet_prec :float = 0
var visible_sour_prec :float = 0
var visible_salty_prec :float = 0
var visible_spicy_prec :float = 0
var visible_bitter_prec :float = 0
var visible_umame_prec :float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(taste_list) == 0:
		PlayerVariables.sweet_prec = 0
		PlayerVariables.sour_prec = 0
		PlayerVariables.spicy_prec = 0
		PlayerVariables.bitter_prec = 0
		PlayerVariables.salty_prec = 0
		PlayerVariables.umame_prec = 0
		visible_sweet_prec = 0
		visible_sour_prec = 0
		visible_spicy_prec = 0
		visible_bitter_prec = 0
		visible_salty_prec = 0
		visible_umame_prec = 0
		$HBoxContainer/Panel.size_flags_stretch_ratio=1
		$HBoxContainer/sour.size_flags_stretch_ratio=0
		$HBoxContainer/sweet.size_flags_stretch_ratio=0
		$HBoxContainer/salty.size_flags_stretch_ratio=0
		$HBoxContainer/spicy.size_flags_stretch_ratio=0
		$HBoxContainer/bitter.size_flags_stretch_ratio=0
		$HBoxContainer/umame.size_flags_stretch_ratio=0
	else:
		$HBoxContainer/Panel.size_flags_stretch_ratio=0
		PlayerVariables.sweet_prec = str(taste_list).count("sweet") / float(len(taste_list))
		PlayerVariables.sour_prec = str(taste_list).count("sour") / float(len(taste_list))
		PlayerVariables.spicy_prec = str(taste_list).count("spicy") / float(len(taste_list))
		PlayerVariables.bitter_prec = str(taste_list).count("bitter") / float(len(taste_list))
		PlayerVariables.salty_prec = str(taste_list).count("salty") / float(len(taste_list))
		PlayerVariables.umame_prec = str(taste_list).count("umame") / float(len(taste_list))
		visible_sweet_prec += PlayerVariables.sweet_prec - visible_sweet_prec * 2 * delta
		visible_sour_prec += PlayerVariables.sour_prec - visible_sour_prec * 2 * delta
		visible_spicy_prec += PlayerVariables.spicy_prec - visible_spicy_prec * 2 * delta
		visible_bitter_prec += PlayerVariables.bitter_prec - visible_bitter_prec * 2 * delta
		visible_salty_prec += PlayerVariables.salty_prec - visible_salty_prec * 2 * delta
		visible_umame_prec += PlayerVariables.umame_prec - visible_umame_prec * 2 * delta
		$HBoxContainer/sweet.size_flags_stretch_ratio=visible_sweet_prec
		$HBoxContainer/sour.size_flags_stretch_ratio=visible_sour_prec
		$HBoxContainer/salty.size_flags_stretch_ratio=visible_salty_prec
		$HBoxContainer/spicy.size_flags_stretch_ratio=visible_spicy_prec
		$HBoxContainer/bitter.size_flags_stretch_ratio=visible_bitter_prec
		$HBoxContainer/umame.size_flags_stretch_ratio=visible_umame_prec
		
func _on_sour_button_pressed() -> void:
	taste_list.append("sour")

func _on_sweet_button_pressed() -> void:
	taste_list.append("sweet")
	
func _on_spicy_button_pressed() -> void:
	taste_list.append("spicy")
	
func _on_bitter_button_pressed() -> void:
	taste_list.append("bitter")
	
func _on_salty_button_pressed() -> void:
	taste_list.append("salty")
	
func _on_umame_button_pressed() -> void:
	taste_list.append("umame")

func _on_reset_button_pressed() -> void:
	taste_list = []
