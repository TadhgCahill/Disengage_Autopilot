#to do:
# - figure out how to go to a different scene
# - get the label to change/ be read after other script call
#see if you can put the buttons all in one script

extends Node2D
#starting health
var enemyHealth = 3;


	
func _ready():
	$Button.text = "nice"
	$Button.pressed.connect(_button_pressed1)
	
	$Button2.text = "distraction"
	$Button2.pressed.connect(_button_pressed2)
	
	$Button3.text = "mean"
	$Button3.pressed.connect(_button_pressed3)
	enemyTurn()
	

func enemyTurn():
	var enemyName = "enemy"
	var enemyAttackString
	var enemyAttack = randi() % 3 #number 0-2
	#0 == "non sequitur"
	#1 == "formality"
	#2 == "crucial info"
	
	if enemyAttack == 0:
		enemyAttackString = "non sequitur"
		
	if enemyAttack == 1:
		enemyAttackString = "formality"
		
	if enemyAttack == 2:
		enemyAttackString = "crucial info"
	
	var label = $RichTextLabel #not working after called by other script
	label.text = enemyName + " uses " + enemyAttackString
	
func resolveRound(playerAttack): #call when player pressses button
	 #not working after called by other script
	var label = $RichTextLabel
	if (playerAttack == 0 && label.text == "enemy uses crucial info") || (playerAttack == 1 && label.text == "enemy uses non sequitur") || (playerAttack == 2 && label.text == "enemy uses formality"):
		print("win")
		enemyHealth = enemyHealth - 2
	else:
		print("loss")
		enemyHealth = enemyHealth + 1
	
	if enemyHealth > 0:
		enemyTurn()
	else:
		get_tree().change_scene_to_file("res://node_2d.tscn") #minigame over
		
		
#buttons
func _button_pressed1():
	resolveRound(0)

func _button_pressed2():
	resolveRound(1)
	
func _button_pressed3():
	resolveRound(2)
