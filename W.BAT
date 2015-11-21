@echo off
echo Making HEXEN.WAD
echo Preprocessing: wadlink.txt to wadlink.wl
wcc386 /dNOMAPS /dREGISTERED /p /fo=wadlink.wl \data\wadlink.txt
echo wadlinking ...
\tools\exe\wadlink
