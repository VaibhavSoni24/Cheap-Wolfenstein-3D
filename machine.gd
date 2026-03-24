extends Area3D

func _on_body_entered(body: Node3D) -> void:
	#Check if the collided body is the player.
	if body.is_in_group("player"):
		if GameManager.current_weapon != "machine" and GameManager.current_weapon != "knife":
			GameManager.current_weapon = "machine"
			$AudioStreamPlayer.play()
			GameManager.last_weapon = "machine"
			set_deferred("monitoring", false)

func _on_audio_stream_player_finished() -> void:
	queue_free()
