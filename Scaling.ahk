#Requires AutoHotkey v2.0+
scaleX(val) {
	return Round(val * ScreenResX / 1920)
}

scaleY(val) {
	return Round(val * ScreenResY / 1080)
}