extends Node2D

onready var nodo_AnimacionSol := $AnimacionSol
onready var nodo_AnimacionFondo := $AnimacionFondo

onready var nodo_Modo := $Modo
onready var nodo_Dificultad := $Dificultad
onready var nodo_Volver := $Volver

var modo
var dificultad
var volver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	guardar_estado_de_visibilidad()
	nodo_AnimacionSol.play("Sol_Quieto")
	nodo_AnimacionFondo.play("Fondo")
	pass

func guardar_estado_de_visibilidad() -> void:
	modo = nodo_Modo.visible
	dificultad = nodo_Dificultad.visible
	volver = nodo_Volver.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func fue_soltado_el_clic(event: InputEvent) -> bool:
	if event.is_action_released("clic"):
		return true
	return false

func _on_Menu_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if fue_soltado_el_clic(event):
		get_tree().change_scene("res://Escenas/Menu/Menu.tscn")

func _on_Un_Jugador_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if fue_soltado_el_clic(event):
		nodo_Modo.visible = false
		nodo_Dificultad.visible = true
		nodo_Volver.visible = true

func establecer_estado_de_visibilidad():
	nodo_Modo.visible = modo
	nodo_Dificultad.visible = dificultad
	nodo_Volver.visible = volver

func _on_Volver_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if fue_soltado_el_clic(event):
		establecer_estado_de_visibilidad()
