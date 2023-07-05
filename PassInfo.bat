@echo off
title PassInfo
color 0a
set pass= none
set user= none
set msg= none
cls
goto menu

:menu
echo -------------------
echo -    PassInfo     -
echo -------------------
echo - 1- Make new MSG -
echo - 2- LOAD MSG     -
echo - 3- Exit         -
echo -------------------
echo.
echo.
echo.
set /p op= Type an Option: 
cls

if %op% == 1 goto MKMSG
if %op% == 2 goto LDMSG
if %op% == 3 goto PIEXT

:LDMSG
echo Type the Name of the MSG file.
echo.
set /p flnm=Type the Name of the file:
if exist %flnm%.flmsg goto usmsg
echo File Dosent Exist!
pause>nul
cls
goto menu

:usmsg
<%flnm%.flmsg (
set /p pass=
set /p user=
set /p msg=
)
echo loaded...
cls
echo Type the User File Access.
echo.
set /p lcuser= Type the user access:
cls 
if %lcuser% == %user% goto psmsg
cls
set pass= none
set user= none
set msg= none
cls
echo INTRUDER ALERT!
echo Incorrect USER! 
echo.
pause>nul
cls
goto menu

:psmsg
echo Type Pass Access File.
echo.
set /p lcpass=type pass access: 
if %lcpass% == %pass% goto shmsg
cls
set pass= none
set user= none
set msg= none
cls
echo INTRUDER ALERT!
echo WRONG PASS!
echo.
pause>nul
cls
goto menu

:shmsg
cls
echo -All Security Steps Done!-
echo Message Down Below:
echo %msg%
echo.
pause>nul
cls
set pass= none
set user= none
set msg= none
cls
goto menu

:PIEXT
cls
exit

:MKMSG
echo Making New FLMSG File
echo ---------------------
echo.
set /p flnm=Type the msg file name: 
cls
set /p user=Type an User to Access the msg: 
cls
set /p pass=Type an Pass to Access the msg:
cls
set /p msg=Type the msg: 
cls
(
echo %pass%
echo %user%
echo %msg%
)> %flnm%.flmsg
cls
echo File Maked!
echo.
pause>nul
cls
set pass= none
set user= none
set msg= none
cls
goto menu