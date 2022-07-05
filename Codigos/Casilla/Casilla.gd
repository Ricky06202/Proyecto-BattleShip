extends Node2D

var estaActiva := false
var seDioClic := false
var acerto := false

var accionRealizada := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area2D_mouse_entered() -> void:
	if estaActiva and not seDioClic:
		$Seleccionado.visible = true


func _on_Area2D_mouse_exited() -> void:
		$Seleccionado.visible = false


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("clic") and not seDioClic and estaActiva:
		seDioClic = true
		$Seleccionado.visible = false
		accionRealizada = true
		if $Area2D.get_overlapping_areas().size() > 0:
			$Acertar.visible = true
			acerto = true
		else:
			$Fallar.visible = true
