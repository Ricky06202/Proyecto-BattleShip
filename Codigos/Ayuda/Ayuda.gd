extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var posicionInicial


# Called when the node enters the scene tree for the first time.
func _ready():
	posicionInicial = $Camera2D.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func mover_camara_derecha():
	$Camera2D.global_position += Vector2(1280,0)
	
func mover_camara_izquierda():
	$Camera2D.global_position += Vector2(-1280,0)

func _on_Izquierda_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("clic"):
		if $Camera2D.global_position == posicionInicial:
			get_tree().change_scene("res://Escenas/Modo de juego/Modo_de_juego.tscn")
		else:
			mover_camara_izquierda()


func _on_Derecha_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("clic"):
		mover_camara_derecha()
