extends Node

func _unhandled_input(_event):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

var ammo = 0
var current_weapon = "knife"
var last_weapon = "gun"
var lives = 3
var current_level = 1
var player_health = 100
var player_score = 0
var player = null
var guard_health = 100
