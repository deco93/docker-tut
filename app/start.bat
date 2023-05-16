@echo off

rem if either of the 2 args are empty execute help echo and
rem run docker ps to show mongo and mongo-express existing containers
if "%1" == "" goto :help
if "%2" == "" goto :help

rem start mongo container
docker start %1
timeout /t 4 /nobreak
rem start mongo-express container
docker start %2
timeout /t 1 /nobreak

npm start
goto :eof
:help
echo either one or both args for start missing
echo USAGE: start.bat MONGO_CONTAINERID MONGO-EXPRESS_CONTAINERID -- order required
echo here's a list of container ids for the args
docker ps -a