#Bomb.gd
extends Area2D

var rotation_speed = 10

#default animation on spawn
func _ready():
	$AnimatedSprite2D.play("moving")

func _on_body_entered(body):
	#if the bomb collides with player, play the explosion animation and start the timer
	if body.name == "Player"	:
		$AnimatedSprite2D.play("explode")
		$Timer.start()
		Global.is_bomb_moving = false
		#deal damage
		if Global.can_hurt == true:
			body.take_damage()
			Global.is_climbing = false
			Global.is_jumping = false
		
	#if the bomb collides with Level tilemap, (floor and walls)
	if body.name == "Level":
		$AnimatedSprite2D.play("explode")
		$Timer.start()
		Global.is_bomb_moving = false


func _on_timer_timeout():
	if is_instance_valid(self):
		self.queue_free()
		
#rolls bomb
func _physics_process(delta):
	#rotate bomb if it explodes
	if Global.is_bomb_moving == true:
		$AnimatedSprite2D.rotation += rotation_speed * delta
