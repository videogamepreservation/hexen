@REM Hexen startup batch file
@echo off

echo :
call castoff
echo :

if "%1x"=="x" goto badargs

set hticargs=-devmaps dev.txt -warp %1
set hticwads=-file
set hticnplay=

:parseloop
if "%2x"=="x" goto doneparse
if "%2"=="m" goto nomonsters
if "%2"=="M" goto nomonsters
if "%2"=="s1" goto skill1
if "%2"=="S1" goto skill1
if "%2"=="s2" goto skill2
if "%2"=="S2" goto skill2
if "%2"=="s3" goto skill3
if "%2"=="S3" goto skill3
if "%2"=="s4" goto skill4
if "%2"=="S4" goto skill4
if "%2"=="s5" goto skill5
if "%2"=="S5" goto skill5
if "%2"=="n1" goto nplay1
if "%2"=="N1" goto nplay1
if "%2"=="n2" goto nplay2
if "%2"=="N2" goto nplay2
if "%2"=="n3" goto nplay3
if "%2"=="N3" goto nplay3
if "%2"=="n4" goto nplay4
if "%2"=="N4" goto nplay4
if "%2"=="p" goto altport
if "%2"=="P" goto altport
if "%2"=="c0" goto class0
if "%2"=="C0" goto class0
if "%2"=="c1" goto class1
if "%2"=="C1" goto class1
if "%2"=="c2" goto class2
if "%2"=="C2" goto class2
if "%2"=="r" goto randclass
if "%2"=="R" goto randclass
goto addwad

:nomonsters
set hticargs=%hticargs% -nomonsters
shift
goto parseloop

:skill1
set hticargs=%hticargs% -skill 1
shift
goto parseloop

:skill2
set hticargs=%hticargs% -skill 2
shift
goto parseloop

:skill3
set hticargs=%hticargs% -skill 3
shift
goto parseloop

:skill4
set hticargs=%hticargs% -skill 4
shift
goto parseloop

:skill5
set hticargs=%hticargs% -skill 5
shift
goto parseloop

:nplay1
set hticnplay=1
shift
goto parseloop

:nplay2
set hticnplay=2
shift
goto parseloop

:nplay3
set hticnplay=3
shift
goto parseloop

:nplay4
set hticnplay=4
shift
goto parseloop

:altport
set hticargs=%hticargs% -port 2
shift
goto parseloop

:class0
set hticargs=%hticargs% -class 0
shift
goto parseloop

:class1
set hticargs=%hticargs% -class 1
shift
goto parseloop

:class2
set hticargs=%hticargs% -class 2
shift
goto parseloop

:randclass
set hticargs=%hticargs% -randclass
shift
goto parseloop

:addwad
set hticwads=%hticwads% %3.wad
shift
goto parseloop

:badargs
echo HEXEN STARTUP
echo Usage: H map [s?] [m] [n?] [p] [wadfile [wadfile ...] ]
echo.
echo      [s?] = skill (1-5)
echo       [m] = no monsters
echo      [n?] = net play (1-4)
echo       [p] = use alternate port setting
echo       [r] = random player class
echo [wadfile] = add external wadfile (.WAD is implicit)
echo.
goto end

:doneparse
if "%hticwads%" == "-file" goto startgame
set hticargs=%hticargs% %hticwads%
:startgame
if "%hticnplay%x" == "x" goto normalplay
echo -nodes %hticnplay% -deathmatch %hticargs%
hexipx -nodes %hticnplay% -deathmatch %hticargs%
goto end

:normalplay
echo %hticargs%
hexen %hticargs%
goto end

:end
set hticargs=
set hticwads=
set hticnplay=

echo :
@call caston
echo :
