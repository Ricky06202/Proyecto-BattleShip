extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimacionSol.play("Sol_Quieto")
	$AnimacionFondo.play("Fondo")
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Menu_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_released("clic"):
			get_tree().change_scene("res://Escenas/Menu/Menu.tscn")
