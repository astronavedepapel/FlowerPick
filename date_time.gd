class_name date_time extends Resource

@export_range(0,59) var seconds: int = 0
@export_range(0,59) var minutes: int = 0
@export_range(6, 18) var hours: int = 6
@export_range(1,3) var days: int = 1

var delta_time: float = 0
var last_hour: int = -1 


func increase_by_sec(delta_seconds: float) -> void:
	delta_time += delta_seconds
	if delta_time < 1: return
	
	var delta_int_secs: int = delta_time
	delta_time -= delta_int_secs
	
	seconds += delta_int_secs
	minutes += seconds / 60
	seconds = seconds % 60
	
	hours += minutes / 60
	minutes = minutes % 60
	
	if hours >= 18:
		hours = 6
		days += 1
		
	print_debug(str(days)+ ":" + str(hours) + ":" +str(minutes) + ":" + str(seconds))
