@echo off

if "%1" EQU "" goto :HELP

if "%1" EQU "start" (
docker-compose -f mongo-docker_compose.yaml up
)

if "%1" EQU "stop" (
docker-compose -f mongo-docker_compose.yaml down
)

goto :EOF






:HELP
echo "arg  missing type: container.bat [start|stop]"
pause