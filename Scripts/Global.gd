### Global.gd

extends Node

#movement states
var is_attacking = false
var is_climbing = false
var is_jumping = false

var can_spawn = true

#current scene
var current_scene_name

#bomb movement state
var is_bomb_moving = false

#can the player be damaged?
var can_hurt = true

#pickups
enum Pickups {HEALTH, SCORE, ATTACK}

func _ready():
	# Sets the current scene's name
	current_scene_name = get_tree().get_current_scene().name

#function to disable box spawning
func disable_spawning():
	can_spawn = false
	
#function to enable box spawning
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
