extends Control
var taste_list :=[]
const sweet := "sweet"
var sweet_prec :float=0.5
const sour := "sour"
var sour_prec :float=0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/sour.size_flags_stretch_ratio=0
	$HBoxContainer/sweet.size_flags_stretch_ratio=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add_prec(index,taste,prec):
	if index==taste:
			prec+=1/len(taste_list)
func _process(delta: float) -> void:
	sweet_prec=0
	sour_prec=0
	
	for i in taste_list:
		if i == "sweet":
			sweet_prec+=1/float(len(taste_list))
		if i == "sour":
			sour_prec+=1/float(len(taste_list))
	
		
	if len(taste_list)!=0:
		$HBoxContainer/Panel.size_flags_stretch_ratio=0
	else:
		$HBoxContainer/Panel.size_flags_stretch_ratio=1

	if sweet_prec!=0:
		$HBoxContainer/sweet.size_flags_stretch_ratio=sweet_prec
	if sour_prec!=0:
		$HBoxContainer/sour.size_flags_stretch_ratio=sour_prec
func _on_sour_button_pressed() -> void:
	taste_list.append(sour)
	
	


func _on_sweet_button_pressed() -> void:
	taste_list.append(sweet)
	
