extends Node

export(PackedScene) var mob_scene
var score

func _ready():
	randomize()
	

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$DeathSound.play()
	
func new_game():
#	Chama a função queue_free em todo mob do grupo "mobs"
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
#	Adicionar fade
# https://godotengine.org/qa/27939/how-to-fade-in-out-an-audio-stream	
	$Music.play()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()
	var mob_spwan_location = $MobPath/MobSpawnLocation
	mob_spwan_location.offset = randi()
	
	var direction = mob_spwan_location.rotation + PI/2
	
	mob.position = mob_spwan_location.position
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
