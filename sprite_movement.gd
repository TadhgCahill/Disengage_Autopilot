extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

@onready var _animation_player = $AnimationPlayer

func _process(delta):
	if Input.is_action_pressed("up"):
		_animation_player.play("walk_up")
	
	if Input.is_action_pressed("right"):
		_animation_player.play("walk_right")
	
	if Input.is_action_pressed("down"):
		_animation_player.play("walk_down")
	
	if Input.is_action_pressed("left"):
		_animation_player.play("walk_left")
