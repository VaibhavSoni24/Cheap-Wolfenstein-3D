extends CharacterBody3D

var knife_range = 3
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 0.05
var can_open_door = false

@onready var ui_script = $ui
@onready var ray = $Camera3D/RayCast3D
@onready var camera: Camera3D = $Camera3D

func _ready():
	GameManager.player = self
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	camera.current = true
	add_to_group("player")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .003)
		camera.rotate_x(-event.relative.y * .003)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
#if want to feel game like...
#	if Input.is_action_pressed("Left"):
#		self.rotate_y(TURN_SPEED)
#	if Input.is_action_pressed("Right"):
#		self.rotate_y(-TURN_SPEED)
	
	if Input.is_action_pressed("Attack"):
		if ui_script.can_shoot:
			shoot()

	move_and_slide()

func shoot():
	var sound_player = $AudioStreamPlayer #Adjusts audio
	
	match GameManager.current_weapon:
		"gun":
			sound_player.stream = preload("res://Assets/gun.ogg")
		"rifle":
			sound_player.stream = preload("res://Assets/machine.ogg")
		"machine":
			sound_player.stream = preload("res://Assets/mini.ogg")
		"knife":
			sound_player.stream = preload("res://Assets/Knife.wav")
	sound_player.play()
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		var distance_to_collider = global_position.distance_to(collider.global_position)
		if GameManager.current_weapon == "knife" and distance_to_collider > knife_range:
			return
		else:
			if collider.has_method("take_damage"):
				collider.take_damage()

func damage():
	GameManager.player_health -= 10
	print(GameManager.player_health)
	if GameManager.player_health <= 0:
		if GameManager.lives <= 1:
			queue_free()
		else:
			GameManager.lives -= 1
			get_tree().change_scene_to_file("res://world.tscn")
			GameManager.player_health = 100
			GameManager.current_weapon = "knife"
			GameManager.ammo = 0
