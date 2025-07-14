#Requires AutoHotkey v2.0+
#Include "ShopInit.ahk"
#Include "BuyItem.ahk"
TravelingRoutine(ThisHotkey := "null")
{
	global
	if (SkyActive || GnomeActive || SummerTravelActive || HoneyActive || MakeHoney) {
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
		Sleep(GlobalDelay)
		Send("{d down}")
		Sleep(150 * MovementMulti)
		Send("{d up}")
		Send("{s down}")
		Sleep(1300 * MovementMulti)
		Send("{s up}")
		Sleep(400)
		Send("e")
		Sleep(3000)
		Send("e")
		MouseMove(xHoney, yHoney, 10)
		Sleep(GlobalDelay * 2)
		Click()
		MouseMove(1, 0, 10, "R")
		Click()
		Sleep(GlobalDelay * 2)
		MouseMove(xHoney, yHoney, 10)
		Sleep(GlobalDelay * 2)
		Click()
		MouseMove(1, 0, 10, "R")
		Click()
		Sleep(1500)
		Sleep(GlobalDelay)
		Send("{" InterfaceButton "}")
		Sleep(GlobalDelay)
		Sleep(2000)
		searchX1 := scaleX(575)
		searchY1 := scaleY(215)
		searchX2 := scaleX(1290)
		searchY2 := scaleY(350)
		ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0x12B4FA, 8)
		if (IgnoreErrors) {
			ErrorLevel := 0
		}
		if (ErrorLevel = 0) {
			FailCounter := 0
			ShopInit()
			Sleep(400)
			; Simplified the routine, easy to change order
			BuyArray := []
			MoveArray := []
			RMoveArray := []
			StepArray := []
			searchX1 := scaleX(530)
			searchY1 := scaleY(0)
			searchX2 := scaleX(870)
			searchY2 := scaleY(1080)
			GnomeDetected := !!PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0xEBFF3C, 8)
			if (!GnomeDetected) {
				if (SkyActive || SummerTravelActive) {
					if ((SkyActive && SkyOpt1) || (SummerTravelActive && Cauliflower)) {
						BuyArray.Push(1)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					
					if ((SkyActive && SkyOpt1) || (SummerTravelActive && Rafflesia)) {
						BuyArray.Push(2)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if ((SkyActive && SkyOpt1) || (SummerTravelActive && GreenApple)) {
						BuyArray.Push(3)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Avocado) {
						BuyArray.Push(4)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Banana) {
						BuyArray.Push(5)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Pineapple) {
						BuyArray.Push(6)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Kiwi) {
						BuyArray.Push(7)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && BellPepper) {
						BuyArray.Push(8)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && PricklyPear) {
						BuyArray.Push(9)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Loquat) {
						BuyArray.Push(10)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Feijoa) {
						BuyArray.Push(11)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					if (SummerTravelActive && Pitcher) {
						BuyArray.Push(12)
						MoveArray.Push(0)
						RMoveArray.Push(0)
						StepArray.Push(0)
					}
					} else {
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
					return
				}
				} else {
				ShopInit()
				searchX1 := scaleX(530)
				searchY1 := scaleY(500)
				searchX2 := scaleX(870)
				searchY2 := scaleY(715)
				HoneyDetected := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, 0xEBFF3C, 8)
				if (HoneyDetected) {
					if (HoneyActive) {
						if (TravelFlowerSeed) {
							BuyArray.Push(1)
							MoveArray.Push(0)
							RMoveArray.Push(1)
							StepArray.Push(1)
						}
						
						if (TravelHoneySprinkler) {
							BuyArray.Push(2)
							MoveArray.Push(1)
							RMoveArray.Push(1)
							StepArray.Push(0)
						}
						if (TravelBeeEgg) {
							BuyArray.Push(3)
							MoveArray.Push(1)
							RMoveArray.Push(2)
							StepArray.Push(1)
						}
						
						if (TravelHoneyCrate) {
							BuyArray.Push(4)
							MoveArray.Push(2)
							RMoveArray.Push(3)
							StepArray.Push(1)
						}
						if (TravelCrafterCrate) {
							BuyArray.Push(5)
							MoveArray.Push(3)
							RMoveArray.Push(4)
							StepArray.Push(1)
						}
						} else {
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
						return
					}
					if (MakeHoney) {
						
		Sleep(400)
		Send("e")
		Sleep(3000)
		Send("e")
		MouseMove(xHoneyConvert, yHoneyConvert, 10)
		Sleep(GlobalDelay * 2)
		Click()
		MouseMove(1, 0, 10, "R")
		Click()
		Sleep(GlobalDelay * 2)
		MouseMove(xHoneyConvert, yHoneyConvert, 10)
		Sleep(GlobalDelay * 2)
		Click()
		MouseMove(1, 0, 10, "R")
		Click()
		Sleep(1500)
					}
					} else {
					if (GnomeActive) {
						if (GnomeOpt1) {
							BuyArray.Push(1)
							MoveArray.Push(0)
							RMoveArray.Push(1)
							StepArray.Push(1)
						}
						
						if (GnomeOpt2) {
							BuyArray.Push(2)
							MoveArray.Push(1)
							RMoveArray.Push(2)
							StepArray.Push(1)
						}
						if (GnomeOpt3) {
							BuyArray.Push(3)
							MoveArray.Push(2)
							RMoveArray.Push(3)
							StepArray.Push(1)
						}
						
						if (GnomeOpt4) {
							BuyArray.Push(4)
							MoveArray.Push(3)
							RMoveArray.Push(4)
							StepArray.Push(1)
						}
						} else {
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
						return
					}
				}
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
		}
		Sleep(GlobalDelay)
		Send("{" InterfaceButton "}")
		Sleep(1000)
	}
}