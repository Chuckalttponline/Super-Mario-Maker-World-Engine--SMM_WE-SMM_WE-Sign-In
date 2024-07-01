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
Password := 1242


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

esc::exitapp