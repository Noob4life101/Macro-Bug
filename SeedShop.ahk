#Requires AutoHotkey v2.0+
#Include "ShopInit.ahk"
#Include "BuyItem.ahk"
SeedShopRoutine(ThisHotkey := "null")
{
	global
	ShopInit()
	Sleep(400)
	; Simplified the routine, easy to change order
	BuyArray := []
	MoveArray := []
	RMoveArray := []
	StepArray := []
	if ((!SummerActive && Carrot) || (SummerActive && Carrot)) {
		BuyArray.Push(1)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Strawberry) || (SummerActive && Strawberry)) {
		BuyArray.Push(2)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && Blueberry) || (SummerActive && Blueberry)) {
		BuyArray.Push(3)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Orange) || (SummerActive && Tomato)) {
		BuyArray.Push(4)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Tomato) || (SummerActive && Cauliflower)) {
		BuyArray.Push(5)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Corn) || (SummerActive && Watermelon)) {
		BuyArray.Push(6)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Daffodil) || (SummerActive && Rafflesia)) {
		BuyArray.Push(7)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Watermelon) || (SummerActive && GreenApple)) {
		BuyArray.Push(8)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Pumpkin) || (SummerActive && Avocado)) {
		BuyArray.Push(9)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Apple) || (SummerActive && Banana)) {
		BuyArray.Push(10)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Bamboo) || (SummerActive && Pineapple)) {
		BuyArray.Push(11)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Coconut) || (SummerActive && Kiwi)) {
		BuyArray.Push(12)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Cactus) || (SummerActive && BellPepper)) {
		BuyArray.Push(13)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Dragon) || (SummerActive && PricklyPear)) {
		BuyArray.Push(14)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Mango) || (SummerActive && Loquat)) {
		BuyArray.Push(15)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	
	if ((!SummerActive && Grape) || (SummerActive && Feijoa)) {
		BuyArray.Push(16)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Mushroom) || (SummerActive && Pitcher)) {
		BuyArray.Push(17)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Pepper) || (SummerActive && SugarApple)) {
		BuyArray.Push(18)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Cacao) || (SummerActive && SummerFruit)) {
		BuyArray.Push(19)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	
	if ((!SummerActive && Beanstalk) || (SummerActive && SummerFruit)) {
		BuyArray.Push(20)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && EmberLily) || (SummerActive && SummerFruit)) {
		BuyArray.Push(21)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && SugarApple) || (SummerActive && SummerFruit)) {
		BuyArray.Push(22)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && BurningBud) || (SummerActive && SummerFruit)) {
		BuyArray.Push(23)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	if ((!SummerActive && GiantPinecone) || (SummerActive && SummerFruit)) {
		BuyArray.Push(24)
		MoveArray.Push(0)
		RMoveArray.Push(0)
		StepArray.Push(0)
	}
	ShopPosition := 1
	ActualSteps := 0
	ShopType := "Sum"
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
	if (ScreenResX > 1920) {
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
