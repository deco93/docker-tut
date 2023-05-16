@echo off

rem to stop docker containers of mongo and mongo express
for /f "tokens=1 skip=1 delims= " %%G in ('docker ps -a') do (
echo stopping container ID is: %%G
docker stop %%G
)

rem to kill the node process
for /f "tokens=2,5 skip=1 delims= " %%G in ('netstat -ano') do (
	if "%%G" == "0.0.0.0:3000" (
		echo port found %%G PID: %%H
		taskkill /f /pid %%H
	)
)