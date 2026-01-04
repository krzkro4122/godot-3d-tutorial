extends CharacterBody3D

signal squashed

@export var min_speed = 10

@export var max_speed = 20

func _physics_process(delta: float) -> void:
	move_and_slide()


func initialize(startPosition: Vector3, playerPosition: Vector3) -> void:
	look_at_from_position(startPosition, playerPosition, Vector3.UP)
	rotate_y(randf_range(-PI / 4, PI / 4))
	
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	$AnimationPlayer.speed_scale = random_speed / min_speed


func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()


func squash():
	squashed.emit()
	queue_free()
