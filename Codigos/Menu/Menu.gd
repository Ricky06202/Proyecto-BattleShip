extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimacionesTitulo.play("Titulo")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Comenzar_timeout():
	#for fuegoArtificial in get_tree().get_nodes_in_group("FuegosArtificiales"):
		#(fuegoArtificial as CPUParticles2D).emitting = true

func _on_AnimacionesTitulo_animation_finished(anim_name):
	$AnimacionesBarcos.play("Barcos")
	$AnimacionesBotones.play("Botones")


func _on_Jugar_input_event(viewport, event, shape_idx):
	if event.is_action_released("clic"):
		get_tree().change_scene("res://Escenas/Modo de juego/Modo_de_juego.tscn")


func _on_Salir_input_event(viewport, event, shape_idx):
	if event.is_action_released("clic"):
		get_tree().quit()
