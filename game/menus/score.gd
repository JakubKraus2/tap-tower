extends CanvasLayer




func gain_score():
	$ScoreText.text = str(GlobalValues.score)
	var tween = create_tween()
	tween.tween_property($ScoreText, "theme_override_font_sizes/font_size", $ScoreText.get("theme_override_font_sizes/font_size")+12, 0.05)
	tween.tween_property($ScoreText, "theme_override_font_sizes/font_size", 28, 0.2)
	var rotation_tween = create_tween()
	rotation_tween.tween_property($ScoreText, "rotation_degrees", randi_range(-32, 32), 0.05)
	rotation_tween.tween_property($ScoreText, "rotation_degrees", 0, 0.2)
