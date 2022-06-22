extends Area2D

export (Texture) var imagenNormal
export (Texture) var imagenSeleccionada
export (Texture) var imagenClic

export (bool) var conTexto

export (String) var texto
export (DynamicFontData) var tipoDeLetra
export (int) var tamanoLetra
export (bool) var todoMayuscula
export (Color) var colorDeLetra
export (int) var tamanoDeContorno
export (Color) var colorDeContorno
export (bool) var usarFiltro

func nuevaLetra() -> DynamicFont:
	var letra := DynamicFont.new()
	letra.size = tamanoLetra
	letra.outline_size = tamanoDeContorno
	letra.outline_color = colorDeContorno
	letra.use_filter = usarFiltro
	letra.font_data = tipoDeLetra
	return letra


var tamanoGrande := Vector2(1.1,1.1)
var tamanoNormal := Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Imagen.texture = imagenNormal
	$Texto.visible = conTexto
	$Texto.set("custom_fonts/font", nuevaLetra())
	$Texto.uppercase = todoMayuscula
	$Texto.text = texto



func _on_Boton_mouse_entered() -> void:
	$Imagen.texture = imagenSeleccionada
	$Imagen.scale = tamanoGrande
	


func _on_Boton_mouse_exited() -> void:
	$Imagen.texture = imagenNormal
	$Imagen.scale = tamanoNormal
	


func _on_Boton_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("clic"):
			$Imagen.texture = imagenClic
			$Imagen.scale = tamanoNormal
			
		else:
			$Imagen.texture = imagenSeleccionada
			$Imagen.scale = tamanoGrande
			
			
		
