extends Node2D

onready var nodo_Imagen := $Imagen
onready var nodo_Deteccion := $Imagen/Deteccion
onready var nodo_Colision := $Imagen/Deteccion/Colision

export (Texture) var imagen
export (int) var vidas

var tamanoNormal := Vector2(1, 1)
var tamanoSeleccionado := Vector2(1.1, 1.1)
var estaAgarrado := false
var gradosDeGiro := PI / 2
var posicionInicial
var posicionDeReposo
var rotacionActual
var rotacionInicial

var casillasDetectadas := 0 
var barcoDetectado := false
var distanciaAceptable := 50

var listo := false
var estaColocado := false


# Called when the node enters the scene tree for the first time.
func _ready():
	posicionDeReposo = global_position
	posicionInicial = global_position
	rotacionActual = global_rotation
	rotacionInicial = global_rotation
	nodo_Imagen.texture = imagen
	ajustar_tamano()
	ajustar_posicion()
	
func ajustar_tamano() -> void:
	var colision := RectangleShape2D.new()
	colision.extents = Vector2(50 * vidas, 50)
	nodo_Colision.shape = colision

func ajustar_posicion() -> void:
	nodo_Imagen.position = Vector2(-50 * (vidas - 1), 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cantidadBarcos := 0
	casillasDetectadas = 0
	var cantidadAcertadas := 0
	for elemento in nodo_Deteccion.get_overlapping_areas():
		if elemento.is_in_group("Barco"):
			cantidadBarcos += 1
		if elemento.is_in_group("Casilla"):
			casillasDetectadas += 1
			if elemento.get_parent().acerto:
				cantidadAcertadas += 1
	
	barcoDetectado = cantidadBarcos > 0
	
	if cantidadAcertadas == vidas:
		visible = true
	
	if estaAgarrado:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, posicionDeReposo, 10 * delta)
		global_rotation = rotacionActual
	estaColocado = not estaAgarrado and int(global_position.distance_to(posicionInicial)) >= 5
	
	if casillasDetectadas < vidas:
		reiniciar_posicion_y_rotacion()

func reiniciar_posicion_y_rotacion():
	posicionDeReposo = posicionInicial
	rotacionActual = rotacionInicial
		
		
func _on_Deteccion_mouse_entered():
	if not estaAgarrado and not listo:
		nodo_Imagen.scale = tamanoSeleccionado


func _on_Deteccion_mouse_exited():
	nodo_Imagen.scale = tamanoNormal


func _on_Deteccion_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("clic") and not listo:
		if estaAgarrado:
			if casillasDetectadas == vidas and not barcoDetectado:
				for casilla in nodo_Deteccion.get_overlapping_areas():
					var distanciaCasilla = global_position.distance_to(casilla.global_position)
					if distanciaCasilla <= distanciaAceptable:
						posicionDeReposo = casilla.global_position
						rotacionActual = global_rotation
			elif casillasDetectadas < vidas:
				reiniciar_posicion_y_rotacion()
					
		nodo_Imagen.scale = tamanoNormal
		estaAgarrado = not estaAgarrado 
		
	if estaAgarrado:
		if event.is_action_pressed("clic_derecho"):
			rotate(gradosDeGiro)
			#gradosDeGiro *= -1
		

