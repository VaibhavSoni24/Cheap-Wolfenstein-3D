extends Node3D

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		GameManager.current_level = 2
		get_tree().change_scene_to_file("res://level_2.tscn")
