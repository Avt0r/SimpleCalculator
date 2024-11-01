extends Node

@onready var LExpression = $LabelExpression
@onready var LResult = $LabelResult

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func writeExpression(num1,num2,op):
	var result
	
	if num1 == null || num1 == 0: 
		result = ""
		LExpression.text = result
		writeResult(num1,num2,op)
		return
	else: 
		result = str(num1)
	
	if !op == null: result = result + op
	else: 
		LExpression.text = result
		writeResult(num1,num2,op)
		return
	
	if num2 != null && num2 != 0: result = result + str(num2)
	LExpression.text = result
	writeResult(num1,num2,op)
	
func writeResult(num1,num2,op):
	var result
	if num1 == null || num1 == 0: 
		LResult.text = ""
		return
	
	if op == null:
		LResult.text = "=" + str(num1)
		return
	
	if num2 == null || num2 == 0:
		LResult.text = "=" + str(num1)
		return
	
	match op:
		"+": result = num1 + num2
		"-": result = num1 - num2
		"*": result = num1 * num2
		"⁄": result = num1 / num2
	LResult.text = "=" + str(result)
