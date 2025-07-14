#Requires AutoHotkey v2.0+
BuyAllSub(ThisHotkey := "null")
{
	global
	AttemptCount := 0
	if (UseReverse && RMoveNumber > MoveNumber && !AltBuy) {
		ShopPosition++
	}
	; Second interaction
	ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0x26EE26, 0)
	if (ErrorLevel = 0) {
		Send("s")
	}
	Sleep(750)
	While (ErrorLevel = 0) {
		if (CraftStep) {
			Send("{Enter}")
			return
			} else {
			Send("{Enter 30}")
		}
		AttemptCount++
		Sleep(GlobalDelay * 2)
		Sleep(GlobalDelay * 2)
		ErrorLevel := 2
		ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0x26EE26, 0)
		if (ErrorLevel = 1){
			Sleep(10)
			ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0x1DB31D, 0)
		}
		if (ErrorLevel = 1){
			Sleep(10)
			ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0x1DB31D, 0)
		}
		Sleep(10)
		AttemptCount++
		if (AttemptCount > BuyCap){
			break
		}
	}
	if (AttemptCount > 0) {
		Send("w")
	}
	if (AttemptCount = 0 && StepNumber) {
		Sleep(GlobalDelay * 2)
		Send("s")
		Sleep(GlobalDelay * 2)
		Send("w")
		Sleep(GlobalDelay * 2)
	}
	return
}