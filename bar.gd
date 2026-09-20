extends Control
var taste_list :=[]
const sweet := "sweet"
const sour := "sour"
var visible_sweet_prec :float = 0
var visible_sour_prec :float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/sour.size_flags_stretch_ratio=0
	$HBoxContainer/sweet.size_flags_stretch_ratio=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(taste_list) == 0:
		PlayerVariables.sweet_prec = 0
		PlayerVariables.sour_prec = 0
		visible_sweet_prec = 0
		visible_sour_prec = 0
		$HBoxContainer/Panel.size_flags_stretch_ratio=1
	else:
		$HBoxContainer/Panel.size_flags_stretch_ratio=0
		PlayerVariables.sweet_prec = str(taste_list).count("sweet") / float(len(taste_list))
		PlayerVariables.sour_prec = str(taste_list).count("sour") / float(len(taste_list))
		visible_sweet_prec += PlayerVariables.sweet_prec - visible_sweet_prec * 2 * delta
		visible_sour_prec += PlayerVariables.sour_prec - visible_sour_prec * 2 * delta
		$HBoxContainer/sweet.size_flags_stretch_ratio=visible_sweet_prec
		$HBoxContainer/sour.size_flags_stretch_ratio=visible_sour_prec
		
func _on_sour_button_pressed() -> void:
	taste_list.append(sour)
	
	


func _on_sweet_button_pressed() -> void:
	taste_list.append(sweet)
	
