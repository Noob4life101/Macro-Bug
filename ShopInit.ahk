#Requires AutoHotkey v2.0+
ShopInit(ThisHotkey := "null")
{
	global
	Sleep(GlobalDelay)
	Send("{s 30}")
	Sleep(GlobalDelay)
	Send("{s 30}")
	Sleep(GlobalDelay)
	Send("w")
	Sleep(GlobalDelay * 2)
	Send("{enter}")
	Sleep(750)
	Send("{w 50}")
	Sleep(GlobalDelay * 2)
	Send("{w 50}")
	Sleep(GlobalDelay)
	Send("{d 2}")
	Sleep(GlobalDelay)
	Send("{s 2}")
	Sleep(GlobalDelay * 2)
	Send("{enter}")
	Sleep(GlobalDelay * 2)
	Send("{enter}")
	Sleep(GlobalDelay * 2)
	return
}
