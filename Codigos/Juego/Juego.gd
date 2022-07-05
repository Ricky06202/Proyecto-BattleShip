extends Node2D

onready var nodo_volver := $Volver
onready var nodo_aceptar := $Aceptar

var estanBloqueados := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

#func colocar_aleatoreamente():
#	for barco in arregloBarcos:
#		pass
#	randomize()
#	rand_range(1,cantidadCasillas)
#	pass

func _on_Aceptar_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("clic"):
		for barco in $Barcos.get_children():
			if not barco.estaColocado:
				return
		for casilla in $CasillasTablero.get_children():
			casilla.estaActiva = true
		estanBloqueados = true
		nodo_volver.visible = false
		nodo_aceptar.visible = false
		for barco in $Barcos.get_children():
			barco.visible = false
			barco.listo = true
		


func _on_Volver_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("clic"):
		get_tree().change_scene("res://Escenas/Modo de juego/Modo_de_juego.tscn")
