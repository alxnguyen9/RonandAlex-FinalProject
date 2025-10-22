### Global.gd

extends Node

#movement states
var is_attacking = false
var is_climbing = false
var is_jumping = false

# Indicates if box can be spawned
var can_spawn = true

#current scene
var current_scene_name

#bomb movement state
var is_bomb_moving = false

#pickups
enum Pickups {HEALTH, SCORE, ATTACK}

#can the player be damaged?
var can_hurt = true

#final level results
var final_score
var final_rating
var final_time

func _ready():
	# Sets the current scene's name
	current_scene_name = get_tree().get_current_scene().name
	
# Function to disable box spawning
func disable_spawning():
	can_spawn = false

# Function to enable box spawning
func enable_spawning():
	can_spawn = true

#sets is_climbing to true to simulate climbing
func _on_body_entered(body):
	if body.name == "Player":
		Global.is_climbing = true

#sets is_climbing to false to simulate climbing
func _on_body_exited(body):
	if body.name == "Player":
		Global.is_climbing = false
		

# 🔢 Get level number based on scene name like "Sprint1", "Sprint2", etc.
func get_level_number_from_scene_name() -> int:
	if current_scene_name.begins_with("Sprint") and current_scene_name.length() > 6:
		var number_part = current_scene_name.substr(6, current_scene_name.length() - 6)
		if number_part.is_valid_int():
			return int(number_part)
	
	# Fallback for unrecognized scene names
	return 0
