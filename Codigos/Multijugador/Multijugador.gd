extends Node2D

onready var nodo_jugador1 := $Jugador1
onready var nodo_jugador2 := $Jugador2

var ambosListos := false
var empezar := false
var turnoImpar := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func alternar_actividad_casillas(jugador, actividad):
	for casilla in jugador.get_node("CasillasTablero").get_children():
		casilla.estaActiva = actividad
		
func se_destruyeron_los_barcos(jugador) -> bool:
	for barco in jugador.get_node("Barcos").get_children():
		print(barco.visible)
		if not barco.visible:
			return false
	return true

func se_realizo_accion(jugador) -> bool:
	for casilla in jugador.get_node("CasillasTablero").get_children():
		if casilla.accionRealizada:
			casilla.accionRealizada = false
			alternar_actividad_casillas(jugador, false)
			return true
	return false

func mover_camara_a(jugador, delta):
	$Camera2D.global_position = lerp($Camera2D.global_position, jugador.global_position, 5 * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	ambosListos = nodo_jugador1.estanBloqueados and nodo_jugador2.estanBloqueados
	# se ejecuta cuando el jugador 1 esta listo
	if not ambosListos and nodo_jugador1.estanBloqueados: 
		alternar_actividad_casillas(nodo_jugador1, false)
		mover_camara_a(nodo_jugador2, delta)
	# se ejecuta cuando el jugador 2 esta listo
	if ambosListos and not empezar: 
		$AnimacionesMensajes.play("TurnoAzul")
		empezar = true
	# le toca al jugador 2
	if empezar and $Espera.is_stopped():
		if turnoImpar:
			alternar_actividad_casillas(nodo_jugador1, true)
			mover_camara_a(nodo_jugador1, delta)
		else:
			alternar_actividad_casillas(nodo_jugador2, true)
			mover_camara_a(nodo_jugador2, delta)
		if se_realizo_accion(nodo_jugador1) or se_realizo_accion(nodo_jugador2):
			$Espera.start()
		


func _on_Espera_timeout() -> void:
	if se_destruyeron_los_barcos(nodo_jugador1) or se_destruyeron_los_barcos(nodo_jugador2):
		if se_destruyeron_los_barcos(nodo_jugador1):
			$AnimacionesMensajes.play("GanasteAzul")
		elif se_destruyeron_los_barcos(nodo_jugador2):
			$AnimacionesMensajes.play("GanasteRojo")
		empezar = false
		alternar_actividad_casillas(nodo_jugador1, false)
		alternar_actividad_casillas(nodo_jugador2, false)
		$Jugador1/Volver.visible = true
		$Jugador2/Volver.visible = true
		return
		
	turnoImpar = not turnoImpar
	if turnoImpar:
		$AnimacionesMensajes.play("TurnoAzul")
	else:
		$AnimacionesMensajes.play("TurnoRojo")
