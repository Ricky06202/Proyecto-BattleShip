extends Node2D

onready var nodo_Imagen := $Imagen
onready var nodo_Colision := $Imagen/Deteccion/Colision

export (Texture) var imagen
export (int) var vidas

# Called when the node enters the scene tree for the first time.
func _ready():
	nodo_Imagen.texture = imagen
	ajustar_tamano()
	
func ajustar_tamano() -> void:
	var colision := RectangleShape2D.new()
	colision.extents = Vector2(50 * vidas, 50)
	nodo_Colision.shape = colision

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Deteccion_mouse_entered():
	print_debug("Colision")
