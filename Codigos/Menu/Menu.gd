extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Animaciones.play("Titulo")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Comenzar_timeout():
	#for fuegoArtificial in get_tree().get_nodes_in_group("FuegosArtificiales"):
		#(fuegoArtificial as CPUParticles2D).emitting = true


