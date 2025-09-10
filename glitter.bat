@echo off
pushd "%~dp0"
powershell -ExecutionPolicy Bypass -File ".\glitter.ps1" %*
popd