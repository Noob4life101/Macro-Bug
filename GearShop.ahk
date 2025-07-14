#Requires AutoHotkey v2.0+
#Include "ShopInit.ahk"
#Include "BuyItem.ahk"
GearShopRoutine(ThisHotkey := "null")
{
	global
	ShopInit()
	
	BuyArray := []
	MoveArray := []
	RMoveArray := []
	StepArray := []
	if (Watering) {
		BuyArray.Push(1)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (Trowel) {
		BuyArray.Push(2)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (Recall) {
		BuyArray.Push(3)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Basic) {
		BuyArray.Push(4)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Advanced) {
		BuyArray.Push(5)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (MediumToy) {
		BuyArray.Push(6)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (MediumTreat) {
		BuyArray.Push(7)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Godly) {
		BuyArray.Push(8)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Magnify) {
		BuyArray.Push(9)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && Mirror) || (SummerActive && Mirror)) {
		BuyArray.Push(10)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Master) {
		BuyArray.Push(11)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Cleansing) {
		BuyArray.Push(12)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if (Favorite) {
		BuyArray.Push(13)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	
	if (Harvest) {
		BuyArray.Push(14)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (Friendship) {
		BuyArray.Push(15)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if (LevelupLolly) {
		BuyArray.Push(16)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
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