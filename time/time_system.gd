class_name time_system extends Node

signal time_reached(hours)
signal updated 


@export_range(0,59) var seconds: int = 0
@export_range(0,59) var minutes: int = 0
@export_range(6, 18) var hours: int = 6
@export_range(1,3) var days: int = 1
@export var date_time : date_time
@export var ticks_pr_second: int = 1

var last_emitted_hour = -1

func _process(delta: float) -> void:
	date_time.increase_by_sec(delta * ticks_pr_second)
	updated.emit(date_time)

	if hours == 9:
		print_debug("Emitindo sinal de mudança de horário:", hours)
		emit_signal("time_reached", hours)
	elif hours == 6:
		print_debug("Emitindo sinal de mudança de horário:", hours)
		emit_signal("time_reached", hours)
