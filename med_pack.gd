extends Area3D

func _on_body_entered(body: Node3D) -> void:
	#Check if the collided body is the player.
	if body.is_in_group("player"):
		#Increment the Player health variable by 10 if its less than 100.
		if (GameManager.player_health < 100):
			GameManager.player_health += 10
			$AudioStreamPlayer.play()
			if (GameManager.player_health > 100):
				GameManager.player_health = 100
			#Queue the med_pack object for deletion.
			set_deferred("monitoring", false)

func _on_audio_stream_player_finished() -> void:
	queue_free()
