extends RigidBody2D

@export var speed := 80.0  # Editable speed in Godot Inspector
var direction := Vector2.RIGHT

func _ready():
	# Set random initial direction
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = direction * speed

func _integrate_forces(state):
	# Maintain constant speed
	if linear_velocity.length() > 0:
		linear_velocity = linear_velocity.normalized() * speed
