#Requires AutoHotkey v2.0+
#Include "UIInitialize.ahk"
#Include "Scaling.ahk"
#Include "ShopInit.ahk"
CraftRoutine(ThisHotkey := "null")
{
	global
	if ((CraftModeA && CraftActiveA) || (CraftModeB && CraftActiveB) || MakeHoney) {
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
			Sleep (500)
		}
		Send("{s down}")
		Sleep(800 * MovementMulti)
		Send("{s up}")
		Sleep(1500)
		;craft A here
		if (CraftModeA && CraftActiveA) {
			Sleep(250)
			Send("c")
			Sleep(250)
			Send("e")
			Sleep(2000)
			Send("e")
			Sleep(2000)
			Send("{" InterfaceButton "}")
			If (UIInitMode) {
				UIInitialize()
			}
			ShopInit()
			Sleep(400)
			; Simplified the routine, easy to change order
			BuyArray := []
			MoveArray := []
			RMoveArray := []
			StepArray := []
			CraftMaterials := []
			CraftMaterialsType := []
			CraftMaterialCount := 0
			Switch CraftTargetA {
				case "Peace Lily":
				BuyArray.Push(1)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterialCount := 2
				CraftTimeA := -1 * 10 * 60 * 1000
				case "Aloe Vera":
				BuyArray.Push(2)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Prickly") ;set text to search for
				CraftMaterialsType.Push(2) ;set tab to search in. 0 is all, 1 is seeds, 2 is fruit, 3 is gear, 4 is pets
				CraftMaterialCount := 1 ;set how many stackable materials there are
				CraftTimeA := -1 * 10 * 60 * 1000 ;Set craft time, -1 is because it should only run the timer once
				case "Guanabana":
				BuyArray.Push(3)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Banana") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 2
				CraftTimeA := -1 * 10 * 60 * 1000
				default:
				CraftActiveB := 0
				return
			}
			
			;insert shop routine
			
			ShopPosition := 1
			ActualSteps := 0
			CraftStep := 1
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
			CraftStep := 0
			BuyArray.RemoveAt(1, BuyArray.Length)
			MoveArray.RemoveAt(1, BuyArray.Length)
			StepArray.RemoveAt(1, BuyArray.Length)
			; Close the shop after purchasing
			Send("{w 100}")
			Send("{" InterfaceButton "}")
			SendSlot := 3
			Loop CraftMaterialCount {
				Send(SendSlot)
				SendSlot++
				Sleep(1500)
				Send("e")
				Sleep(1500)
			}
			For k, NameOfThing in CraftMaterials {
				NameToSearch := CraftMaterials[k]
				CraftTab := CraftMaterialsType[k]
				GetMaterials()
			}
			Sleep(800)
				Send("e")
			CraftActiveA := 0
			SetTimer(ResetCraftTimer.Bind(0),CraftTimeA)
			
		}
		;craft B here
		if ((CraftModeB && CraftActiveB) || MakeHoney) {
			Send("{s down}")
			Sleep(500 * MovementMulti)
			Send("{s up}")
			Sleep(250)
			}
		if (CraftModeB && CraftActiveB) {
			Sleep(250)
			Send("c")
			Send("e")
			Sleep(2000)
			Send("e")
			Sleep(2000)
			Send("{" InterfaceButton "}")
			If (UIInitMode) {
				UIInitialize()
			}
			ShopInit()
			Sleep(400)
			; Simplified the routine, easy to change order
			BuyArray := []
			MoveArray := []
			RMoveArray := []
			StepArray := []
			CraftMaterials := []
			CraftMaterialsType := []
			CraftMaterialCount := 0
			Switch CraftTargetB {
				case "Lightning":
				BuyArray.Push(1)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterialCount := 3
				CraftTimeB := -1 * 45 * 60 * 1000
				case "Reclaimer":
				BuyArray.Push(2)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterialCount := 2 ;set how many stackable materials there are
				CraftTimeB := -1 * 25 * 60 * 1000 ;Set craft time, -1 is because it should only run the timer once
				case "Tropical Sprinkler":
				BuyArray.Push(3)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Coconut") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Dragon") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Mango") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Berry Sprinkler":
				BuyArray.Push(4)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Grape") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Blueberry") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Strawberry") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Spice Sprinkler":
				BuyArray.Push(5)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Pepper") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Ember") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Cacao") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Sweet Sprinkler":
				BuyArray.Push(6)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Watermelon") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Watermelon") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Watermelon") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Flower Sprinkler":
				BuyArray.Push(7)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Tulip") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Daffodil") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 2
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Stalk Sprinkler":
				BuyArray.Push(8)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Bamboo") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Beanstalk") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Mushroom") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 60 * 60 * 1000
				case "Choc Spray":
				BuyArray.Push(9)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Cacao") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 12 * 60 * 1000
				case "Chilled Spray":
				BuyArray.Push(10)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterialCount := 2
				CraftTimeB := -1 * 5 * 60 * 1000
				case "Shocked Spray":
				BuyArray.Push(11)
				MoveArray.Push(0)
				RMoveArray.Push(0)
				StepArray.Push(0)
				CraftMaterials.Push("Lightning") ;set text to search for
				CraftMaterialsType.Push(3)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 30 * 60 * 1000
				case "Anti Bee":
				BuyArray.Push(12)
				MoveArray.Push(0)
				RMoveArray.Push()
				StepArray.Push(1)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 2 * 60 * 60 * 1000
				case "Small Toy":
				BuyArray.Push(13)
				MoveArray.Push(1)
				RMoveArray.Push(1)
				StepArray.Push(0)
				CraftMaterials.Push("Coconut") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 2
				CraftTimeB := -1 * 10 * 60 * 1000
				case "Small Treat":
				BuyArray.Push(14)
				MoveArray.Push(1)
				RMoveArray.Push(1)
				StepArray.Push(0)
				CraftMaterials.Push("Blueberry") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 2
				CraftTimeB := -1 * 10 * 60 * 1000
				case "Pack Bee":
				BuyArray.Push(15)
				MoveArray.Push(1)
				RMoveArray.Push(2)
				StepArray.Push(1)
				CraftMaterials.Push("Sunflower") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterials.Push("Dahlia") ;set text to search for
				CraftMaterialsType.Push(2)
				CraftMaterialCount := 1
				CraftTimeB := -1 * 4 * 60 * 60 * 1000
				default:
				CraftActiveB := 0
			}
			
			;insert shop routine
			
			ShopPosition := 1
			ActualSteps := 0
			CraftStep := 1
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
			CraftStep := 0
			BuyArray.RemoveAt(1, BuyArray.Length)
			MoveArray.RemoveAt(1, BuyArray.Length)
			StepArray.RemoveAt(1, BuyArray.Length)
			; Close the shop after purchasing
			Send("{w 100}")
			Sleep(1500)
			Send("{" InterfaceButton "}")
			SendSlot := 6
			Loop CraftMaterialCount {
				Send(SendSlot)
				SendSlot++
				Sleep(1500)
				Send("e")
				Sleep(1500)
			}
			For k, NameOfThing in CraftMaterials {
				NameToSearch := CraftMaterials[k]
				CraftTab := CraftMaterialsType[k]
				GetMaterials()
			}
			Sleep(800)
			Send("e")
			CraftActiveB := 0
			SetTimer(ResetCraftTimer.Bind(1),CraftTimeB)
			
		}
	}
}
ResetCraftTimer(WhichOne)
{
	global
	if (WhichOne) {
		CraftActiveB := 1
		} else {
		CraftActiveA := 1
	}
}
GetMaterials(ThisHotkey := "null")
{
	global
	Send("{" InterfaceButton "}")
	If (UIInitMode) {
		UIInitialize()
	}
	Sleep(800)
	Send("{" InventoryKey "}")
	Sleep(2000)
	Sleep(GlobalDelay * 2)
	Send("{d 3}")
	Sleep(500)
	Send("{s}")
	Sleep(500)
	Send("{s}")
	Sleep(GlobalDelay * 2)
	Send("{enter}")
	Sleep(400)
	Send("^a{Backspace}")
	Sleep(400)
	Send("{Raw}" NameToSearch)
	Sleep(400)
	Send("{enter}")
	Sleep(GlobalDelay * 2)
	Send("{a 3}")
	Sleep(GlobalDelay)
	Send("{s " CraftTab "}")
	Sleep(GlobalDelay * 3)
	Send("{enter}")
	Sleep(GlobalDelay)
	Send("{d 2}")
	Sleep(GlobalDelay)
	Send("{enter}")
	Sleep(GlobalDelay)
	Send("{s 55}")
	Sleep(GlobalDelay)
	Send("{enter}")
	Send(1)
	Sleep(GlobalDelay)
	Send("e")
	Send("{w 60}")
	Sleep(400)
	Send("{" InventoryKey "}")
	Sleep(GlobalDelay)
	Send("{" InterfaceButton "}")
	Sleep(400)
	
}