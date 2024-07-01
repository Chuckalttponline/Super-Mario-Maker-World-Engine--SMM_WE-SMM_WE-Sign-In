#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv
#SingleInstance Force
SetKeyDelay, 1
SetMouseDelay, -100
SetBatchLines, -1
Listlines, off
SetTitleMatchMode, 3
#notrayicon




; Check if the shortcut exists
IfNotExist, %A_AppData%\Microsoft\Windows\Start Menu\Programs\Startup\SMM_WE_SIGNIN.lnk
{
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
	exitapp
}	
notinstalling := false
Gui, +LastFound -Caption -Border +ToolWindow +E0x20
Gui, Add, Text, vStatus,, Installing: SMM_WE_SIGNIN
Gui, Add, Progress, vMyProgress w300 h20 cEFCC00, 0
Gui, Color, 83BBFF
WinSet, Region, 0-0 W320 H51 R10-10
Gui, Show, , My Progress Bar

    ; Create the folder if it doesn't exist
    FileCreateDir, C:\Program Files\SMM_WE_SIGNIN
sleep, 500    
FileInstall, 1lock.png, C:\Program Files\SMM_WE_SIGNIN\1lock.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 2lock.png, C:\Program Files\SMM_WE_SIGNIN\2lock.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 3lock.png, C:\Program Files\SMM_WE_SIGNIN\3lock.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 4lock.png, C:\Program Files\SMM_WE_SIGNIN\4lock.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 1arrow.png, C:\Program Files\SMM_WE_SIGNIN\1arrow.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 2arrow.png, C:\Program Files\SMM_WE_SIGNIN\2arrow.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 3arrow.png, C:\Program Files\SMM_WE_SIGNIN\3arrow.png
GuiControl,, MyProgress, +6
sleep, 10
FileInstall, 4arrow.png, C:\Program Files\SMM_WE_SIGNIN\4arrow.png
GuiControl,, MyProgress, +6
sleep, 10




    ; Copy the script itself
    FileCopy, %A_ScriptFullPath%, C:\Program Files\SMM_WE_SIGNIN
GuiControl,, MyProgress, +6
sleep, 10
    ; Extract the shortcut
    FileInstall, SMM_WE_SIGNIN.lnk, %A_AppData%\Microsoft\Windows\Start Menu\Programs\Startup\SMM_WE_SIGNIN.lnk
	GuiControl,, MyProgress, +6
	sleep, 10
    Loop
{
    IfExist, C:\Program Files\SMM_WE_SIGNIN\SMM_WE_SIGNIN.exe
        break
    Sleep, 100
}
GuiControl,, MyProgress, +6
sleep, 10

GuiControl,, MyProgress, +6
sleep, 10
    ; Extract and run the VBS script
    FileInstall, DeleteMe.vbs, DeleteMe.vbs
	GuiControl,, MyProgress, +6
	sleep, 10
    Loop
{
    IfExist, %A_ScriptDir%\DeleteMe.vbs
        break
    Sleep, 100
}
GuiControl,, MyProgress, +6
sleep, 10
GuiControl,, MyProgress, +6
sleep, 10
GuiControl,, MyProgress, 100
GuiControl,, Status, Finished!
Gui, Destroy
sleep, 1000
enterpass:
Gui, +LastFound -Caption -Border +ToolWindow
Gui, Color, 83BBFF
Gui, Add, Text,, Enter your SMM_WE password`n     For CourseWorld.
Gui, Add, Edit, vPassword
Gui, Add, Button, 	x130 y37 Default, OK
Gui, Show, , Enter SMM_WE Password
WinSet, Region, 3-3 W170 H80 R10-10
return

ButtonOK:
Gui, Submit
if (Password = "")
{
    Gui, Show
}
else
{
    IniWrite, %Password%, C:\Program Files\SMM_WE_SIGNIN\SMM_WEPASSWORD.ini, SMM_WEPASSWORD, Word
}

sleep, 200
Run, C:\Program Files\SMM_WE_SIGNIN\SMM_WE_SIGNIN.exe
Gui, Destroy
sleep, 200

Run, DeleteMe.vbs
ExitApp
}
notinstalling := true
IniRead, Password, SMM_WEPASSWORD.ini, SMM_WEPASSWORD, Word











#If, notinstalling
Settimer, Checkwinactive, 2000
return

Checkwinactive:
IfWinActive, SMM_WE
{
Settimer, signin, 200
}
IfWinNotActive, SMM_WE
{
Settimer, signin, off
}
return



signin:
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 4lock.png
if ErrorLevel = 0
{
MouseGetPos, OLDX, OLDY
MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
send, %Password%
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 4arrow.png

MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
MouseMove, %OLDX%, %OLDY%
sleep, 5000
return
}

if ErrorLevel = 1
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 3lock.png
if ErrorLevel = 0
{
MouseGetPos, OLDX, OLDY
MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
send, %Password%
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 3arrow.png

MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
MouseMove, %OLDX%, %OLDY%
sleep, 5000
return
}

if ErrorLevel = 1
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 2lock.png
if ErrorLevel = 0
{
MouseGetPos, OLDX, OLDY
MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
send, %Password%
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 2arrow.png

MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
MouseMove, %OLDX%, %OLDY%
sleep, 5000
return
}

if ErrorLevel = 1
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 1lock.png
if ErrorLevel = 0
{
MouseGetPos, OLDX, OLDY
MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
send, %Password%
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransFF00FB 1arrow.png

MouseMove, %FoundX%, %FoundY%
SendInput, {Click down}
sleep, 30
SendInput, {Click up}
sleep, 20
MouseMove, %OLDX%, %OLDY%
sleep, 5000
return
}

if ErrorLevel = 1
Return
#If
