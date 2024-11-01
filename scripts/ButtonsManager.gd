extends Node

var num1 = null
var num2 = null
var operator = null

@onready var buttonsNums=[
	$ButtonN0,
	$ButtonN1,
	$ButtonN2,
	$ButtonN3,
	$ButtonN4,
	$ButtonN5,
	$ButtonN6,
	$ButtonN7,
	$ButtonN8,
	$ButtonN9
]

@onready var buttonsOperations= [
	$ButtonPlus,
	$ButtonMinus,
	$ButtonMultiply,
	$ButtonDivide
]

@onready var buttonDel = $ButtonDel
@onready var buttonClear = $ButtonClear

@onready var OutputManager = get_node("../Output")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for b in 10:
		buttonsNums[b].pressed.connect(func()-> void:NumPress(b))
	pass # Replace with function body.
	
	for b in 4:
		buttonsOperations[b].pressed.connect(func() -> void: OperatorPress(buttonsOperations[b].text))
	
	buttonClear.pressed.connect(func() -> void: num1 = null; num2 = null; operator = null; OutputManager.writeExpression(num1,num2,operator))
	buttonDel.pressed.connect(DeletePress)

func DeletePress():
	if num2 == null || num2 == 0:
		if operator == null:
			num1 /= 10
			if num1 == 0: num1 = null
		else:
			operator = null
	else:
		num2 /= 10
	OutputManager.writeExpression(num1,num2,operator)

func NumPress(num):
	if operator == null :
		if num1 == null:
			num1 = num
		else:
			num1 *= 10
			num1 += num
	else:
		if num2 == null:
			num2 = num
		else:
			num2 *= 10
			num2 += num
	OutputManager.writeExpression(num1,num2,operator)

func OperatorPress(op):
	operator = op
	OutputManager.writeExpression(num1,num2,operator)
