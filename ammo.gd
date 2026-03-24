extends Area3D

func _on_body_entered(body: Node3D) -> void:
	#Check if the collided body is the player.
	if body.is_in_group("player"):
		#Increment the Game Manager ammo variable by 10.
		GameManager.ammo += 10
		$AudioStreamPlayer.play()
		GameManager.current_weapon = GameManager.last_weapon
		#Queue the ammo object for deletion.
		set_deferred("monitoring", false)

func _on_audio_stream_player_finished() -> void:
	queue_free()
