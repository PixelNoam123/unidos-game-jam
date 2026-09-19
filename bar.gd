extends Control
var taste_list :=[]
const sweet := "sweet"
var sweet_prec :float=0
const sour := "sour"
var sour_prec :float=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/sour.size_flags_stretch_ratio=0
	$HBoxContainer/sweet.size_flags_stretch_ratio=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add_prec(index,taste,prec):
	if index==taste:
			prec+=1/len(taste_list)
func change_bar_part(bar_part,prec):
	bar_part.size_flags_stretch_ratio=prec
func _process(delta: float) -> void:
	sweet_prec=0
	sour_prec=0
	
	for i in taste_list:
		if sweet=="sweet":
			sweet_prec+=1/len(taste_list)
		add_prec(i,sour,sour_prec)
	if len(taste_list)!=0:
		$HBoxContainer/Panel.size_flags_stretch_ratio=0
	else:
		$HBoxContainer/Panel.size_flags_stretch_ratio=1
	change_bar_part($HBoxContainer2/sweet_button,sweet_prec)
	change_bar_part($HBoxContainer2/sour_button,sour_prec)
	print(sweet_prec)


func _on_sour_button_pressed() -> void:
	taste_list.append(sour)
	$HBoxContainer/sour.size_flags_stretch_ratio+=1
	


func _on_sweet_button_pressed() -> void:
	taste_list.append(sweet)
	$HBoxContainer/sweet.size_flags_stretch_ratio+=1
	
