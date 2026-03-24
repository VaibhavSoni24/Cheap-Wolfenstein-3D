extends CanvasLayer

var time_since_last_shoot = 0.0
var fire_rate = 1.0
var can_shoot = true
var weapon_texture = {
"knife": preload("res://Assets/hudknife.png"),
"gun": preload("res://Assets/hudgun.png"),
"rifle": preload("res://Assets/hudmachinegun.png"),
"machine": preload("res://Assets/hudmini.png")     #and so on...
}

func _ready():
	$AnimatedSprite2D.animation_finished.connect(_on_AnimatedSprite2D_animation_finished)
	$AnimatedSprite2D.play(GameManager.current_weapon + "_idle")
	update_weapon_icon()

func _process(delta):
	time_since_last_shoot += delta
	can_shoot = time_since_last_shoot >= (1.0 / fire_rate)
	
	if GameManager.current_weapon != "knife" and GameManager.ammo <= 0:
		GameManager.current_weapon = "knife"
		$AnimatedSprite2D.play("knife_idle")
		
	if Input.is_action_pressed("Attack") and can_shoot:
		if GameManager.current_weapon == "knife":
			$AnimatedSprite2D.play("knife_stab")
		else:
			$AnimatedSprite2D.play(GameManager.current_weapon + "_shoot")
		time_since_last_shoot = 0.0
		
		if GameManager.current_weapon != "knife":
			if GameManager.ammo > 0:
				GameManager.ammo -= 1
	
	match GameManager.current_weapon:
		"gun":
			fire_rate = 3.0
		"rifle":
			fire_rate = 6.0
		"machine":
			fire_rate = 10.0
		"knife":
			fire_rate = 2.0
		_:
			fire_rate = 1.0
	
	update_player_health()
	update_player_ammo()
	update_player_lives()
	update_face_animation(GameManager.player_health)
	update_player_level()
	update_player_score()
	update_weapon_icon()

func _on_AnimatedSprite2D_animation_finished():
	$AnimatedSprite2D.play(GameManager.current_weapon + "_idle")

func update_player_health():
	$HP.text = str(GameManager.player_health)

func update_player_ammo():
	$Bullets.text = str(GameManager.ammo)

func update_player_lives():
	$Life.text = str(GameManager.lives)

func update_player_level():
	$lvl.text = str(GameManager.current_level)

func update_player_score():
	$Points.text = str(GameManager.player_score)

func update_face_animation(health):
	var animation_name = ""
	if health > 90:
		animation_name = "100"
	elif health > 75:
		animation_name = "90"
	elif health > 60:
		animation_name = "75"
	elif health > 45:
		animation_name = "60"
	elif health > 30:
		animation_name = "45"
	elif health > 15:
		animation_name = "30"
	else:
		animation_name = "15"
	
	$BJ.play(animation_name)

func update_weapon_icon():
	if $weapon.texture != weapon_texture[GameManager.current_weapon]:
		$weapon.texture = weapon_texture[GameManager.current_weapon]
