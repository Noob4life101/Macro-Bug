#Requires AutoHotkey v2.0+
UIInitialize(ThisHotkey := "null")
{
global
Send("{a 20}")
Sleep(GlobalDelay)
Send("{w 20}")
Sleep(GlobalDelay*5)
}