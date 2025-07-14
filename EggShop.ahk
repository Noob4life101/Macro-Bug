#Requires AutoHotkey v2.0+
#Include "UIInitialize.ahk"
#Include "..\Modules\Scaling.ahk"
EggShop(){
	global
	if (!GearsValue) {
		
		if (WrenchActive) {
			Send("{" WrenchSlot "}")
			Sleep(1000)
			MouseMove(scaleX(700), scaleY(250), 10)
			Sleep(400)
			Click()
			MouseMove(1, 0, 10, "R")
			Sleep(100)
			Click()
			Sleep(800)
			} else {
			Send("{" InterfaceButton "}")
			
			If (UIInitMode) {
				UIInitialize()
			}
			Send(0)
			Send(0)
			Sleep(GlobalDelay)
			Send("s")
			Sleep(GlobalDelay)
			Send("{Enter}")
			Sleep(400)
			Send("{Enter}")
			Sleep(400)
			Send("w")
			Sleep(GlobalDelay)
			Send("{" InterfaceButton "}")
			Sleep(500)
			Send("{s down}")
			Sleep(300 * MovementMulti)
			Send("{s up}")
			Sleep(GlobalDelay)
			Send("{d down}")
					Sleep(17150 * MovementMulti)
					Send("{d up}")
					Sleep(GlobalDelay)
					Send("{w down}")
					Sleep(250 * MovementMulti)
					Send("{w up}")
					Send("{d down}")
					Sleep(2000 * MovementMulti)
					Send("{d up}")
					Sleep(GlobalDelay)
					Send("{a down}")
					Sleep(200)
					Send("{a up}")
					Send("{w down}")
					Sleep(650 * MovementMulti)
					Send("{w up}")
					Sleep (GlobalDelay * 5)
		}
	}
	
	Send("{w down}")
	if (WrenchActive) {
		Sleep(670 * MovementMulti)
		} else {
		Sleep(680 * MovementMulti)
	}
	Send("{w up}")
	Sleep(250)
	Send(0)
	Send(0)
	Send("e")
			Send("e")
			Sleep(1500)
			Send("e")
			Sleep(1500)	
			
			
			MouseMove(xEgg, yEgg, 10)
			Sleep(GlobalDelay * 2)
			Click()
			MouseMove(1, 0, 10, "R")
			Click()
			Sleep(GlobalDelay * 2)
			MouseMove(xEgg, yEgg, 10)
			Sleep(GlobalDelay * 2)
			Click()
			MouseMove(1, 0, 10, "R")
			Click()
			Sleep(1500)
	Send("{" InterfaceButton "}")
	If (UIInitMode) {
		UIInitialize()
	}
	ShopInit()
	
	BuyArray := []
	MoveArray := []
	RMoveArray := []
	StepArray := []
	if (CommonEgg) {
		BuyArray.Push(1)
		MoveArray.Push(0)
		RMoveArray.Push(1)
		StepArray.Push(1)
	}
	if (SummerCommonEgg) {
		BuyArray.Push(2)
		MoveArray.Push(1)
		RMoveArray.Push(2)
		StepArray.Push(1)
	}
	if (SummerRareEgg) {
		BuyArray.Push(3)
		MoveArray.Push(2)
		RMoveArray.Push(3)
		StepArray.Push(1)
	}
	
	if (MythEgg) {
		BuyArray.Push(4)
		MoveArray.Push(3)
		RMoveArray.Push(4)
		StepArray.Push(1)
	}
	
	if (ParadiseEgg) {
		BuyArray.Push(5)
		MoveArray.Push(4)
		RMoveArray.Push(5)
		StepArray.Push(1)
	}
	if (BugEgg) {
		BuyArray.Push(6)
		MoveArray.Push(5)
		RMoveArray.Push(6)
		StepArray.Push(1)
	}
				ShopPosition := 1
				ActualSteps := 0
				if (ReverseOrder) {
					ReverseOrder := 0
					UseReverse := 1
					BuyAmount := BuyArray.Length
					BuyTest := BuyArray[BuyAmount]
					Loop BuyAmount {
						ItemNumber := BuyArray[BuyAmount]
						MoveNumber := MoveArray[BuyAmount]
						RMoveNumber := RMoveArray[BuyAmount]
						StepNumber := StepArray[BuyAmount]
						BuyAmount--
						BuyItem()
						if(!AltBuy){
						ReverseOrder := 1
						}
						UseReverse := 0
					}
					ReverseOrder := 1
					} else {
					For k, ItemNumber in BuyArray {
						MoveNumber := MoveArray[k]
						RMoveNumber := RMoveArray[k]
						StepNumber := StepArray[k]
						BuyItem()
					}
				}
				BuyArray.RemoveAt(1, BuyArray.Length)
				MoveArray.RemoveAt(1, BuyArray.Length)
				StepArray.RemoveAt(1, BuyArray.Length)
				; Close the shop after purchasing
				Send("{w 100}")
				Sleep(400)
				Send("s")
				Sleep(50)
				Send("{d 2}")
				Sleep(GlobalDelay)
				Send("s")
				Sleep(GlobalDelay)
	if (ScreenResX > 1920) { ;correctionforresolutions
		Send("d")
		Sleep(GlobalDelay)
	}
				Send("{enter}")
				Sleep(GlobalDelay * 2)
				Send("w")
				Sleep(GlobalDelay)
				Send("{" InterfaceButton "}")
	Sleep(1000)
}