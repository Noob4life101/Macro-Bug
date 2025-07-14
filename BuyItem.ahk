#Requires AutoHotkey v2.0+
#Include "ShopInit.ahk"
#Include "BuyAllSub.ahk"
BuyItem(ThisHotkey := "null")
{
	global
	searchX1 := scaleX(620)
	searchY1 := scaleY(300)
	searchX2 := scaleX(900)
	searchY2 := scaleY(900)
	Switch ItemNumber {
		default:
		if (ReverseOrder ) {
			MoveNumber := RMoveNumber
		}
		ActualSteps := ItemNumber + MoveNumber - ShopPosition
		if (DebugMode) {
		ToolTip(ActualSteps " - " ShopPosition " - " MoveNumber " - " ItemNumber)
		}
		ShopPosition := MoveNumber + ItemNumber
		if (AltBuy) {
			ShopInit()
			ShopPosition := 1
			}
			Sleep(GlobalDelay)
		if (ActualSteps > 0) {
			Loop ActualSteps {
			Send("{s}")
			Sleep(GlobalDelay)
			}
			} else {
			if (ActualSteps < 0) {
			Loop Abs(ActualSteps) {
				Send("{w}")
			Sleep(GlobalDelay)
			}
			}
		}
		Send("{enter}")
		Sleep(750)
		if (StepNumber) {
			Send("s")
			Sleep(800)
		}
		Sleep(GlobalDelay * 2)
		BuyAllSub()
		Sleep(GlobalDelay * 2)
		Send("{enter}")
		Sleep(750)
	}
	
	return
}