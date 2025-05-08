@echo off
:: Prompt for username
set /p SSH_USER=Enter your SSH username: 

:: Server and port settings
set SERVER=csic2.som.emory.edu
set REMOTE_PORT=8000
set LOCAL_PORT=8080

echo Connecting to %SERVER% as %SSH_USER% and forwarding port %REMOTE_PORT% to localhost:%LOCAL_PORT% ...
ssh -L %LOCAL_PORT%:localhost:%REMOTE_PORT% %SSH_USER%@%SERVER%
