#Requires AutoHotkey v2.0+
AutoAlignRoutine(ThisHotkey := "null")
{
	global
	if (AutoAlign) {
		MouseMove(scaleX(700), scaleY(250), 10)
	SendMode("Event")
		Sleep(GlobalDelay)
		Loop 10 {
		Click("Down Right")
		MouseMove(0,100,2,"R")
		Sleep(50)
		Click("Up Right")
		Sleep(50)
		MouseMove(scaleX(700), scaleY(250), 10)
		}
		Sleep(GlobalDelay * 3)
if (!SlowMode) {
	SendMode("Input")
}
		MouseMove(scaleX(700), scaleY(250), 10)
		Loop 60 {
			Send("{WheelDown}")
			Sleep(10)
		}
		
		Sleep(500)
		
		Loop 6 {
			Send("{Wheelup}")
			Sleep(GlobalDelay)
		}
		
		Sleep(1000)
		Send("{Escape}")
		Sleep(500)
		Send("{Tab}")
		Sleep(400)
		Send("{Down}")
		Sleep(300)
		Loop 2 {
			Send("{Right}")
			Sleep(400)
		}
		Sleep(100)
		Send("{Escape}")
		Sleep(500)
		
		
		Send("{" InterfaceButton "}")
		Sleep(400)
		Loop 3 {
			Send("{Right}")
		}
		Loop 8 {
			Send("{Enter}")
			Sleep(300)
			Loop 2 {
				Send("{Right}")
			}
			Sleep(300)
			Send("{Enter}")
			Sleep(300)
			Loop 2 {
				Send("{Left}")
			}
			Sleep(500)
		}
		Sleep(300)
		
		Send("{" InterfaceButton "}")
		Send("{Escape}")
		Sleep(500)
		Send("{Tab}")
		Sleep(400)
		Send("{Down}")
		Sleep(300)
		Loop 2 {
			Send("{Right}")
			Sleep(400)
		}
		Sleep(100)
		Send("{Escape}")
		Sleep(600)
		
		Send("{" InterfaceButton "}")
		Sleep(400)
		Loop 3 {
			Send("{Right}")
		}
		Sleep(300)
		Send("{Enter}")
		Sleep(300)
		
		Send("{" InterfaceButton "}")
		Sleep(500)
	}
}