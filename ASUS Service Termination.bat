::	github.com/nmarhari

::	script to disable the following services (meant for Zephyrus G14):
::		ASUS App Service
::		ASUS Software Manager
::		ASUS Switch
::		ASUS Support Serivce (Executable)
::		ASUS System Analysis
::		ASUS System Diagnosis
::		ASUS Update Service (asus)
::		ASUS Update Service (asusm)


@echo off

:: check if in admin
if not "%1"=="am_admin" (
	powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
	exit /b
)

:: ASUS App Serivce

echo Disabling ASUS App Service:
sc config AsusAppService start= disabled
echo Stopping ASUS App Service:
sc stop AsusAppService
echo.

:: ASUS Software Manager
echo Disabling ASUS Software Manager:
sc config ASUSSoftwareManager start= disabled
echo Stopping ASUS Sofware Manager:
sc stop ASUSSoftwareManager
echo.

:: ASUS Switch:
echo Disabling ASUS Switch
sc config ASUSSwitch start= disabled
echo Stopping ASUS Switch:
sc stop ASUSSwitch
echo.

:: ASUS Support Serivce (Executable):
::echo Disabling ASUS Support Service
::sc config # start= disabled
echo Stopping ASUS Support Service Executable:
taskkill /f /im AsusSupportService.exe
echo.

:: ASUS System Analysis:
echo Disabling ASUS System Analysis
sc config ASUSSystemAnalysis start= disabled
echo Stopping ASUS System Analysis:
sc stop ASUSSystemAnalysis
echo.

:: ASUS System Diagnosis:
echo Disabling ASUS System Diagnosis
sc config ASUSSystemDiagnosis start= disabled
echo Stopping ASUS System Diagnosis:
sc stop ASUSSystemDiagnosis
echo.

:: ASUS Update Service (asus):
echo Disabling ASUS Update Service (asus)
sc config asus start= disabled
echo Stopping ASUS Update Service (asus):
sc stop asus
echo.

:: ASUS Update Service (asusm):
echo Disabling ASUS Update Service (asusm)
sc config asusm start= disabled
echo Stopping ASUS Update Service (asusm):
sc stop asusm
echo


:: Done
pause
exit


:: Template for other ASUS services

:: ASUS #:
echo Disabling ASUS #
sc config # start= disabled
echo Stopping ASUS #:
sc stop #
echo.