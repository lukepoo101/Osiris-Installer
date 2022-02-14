@echo off
Title Osiris CSGO Multihack install

set MSBuildPath="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
if not exist %MSBuildPath% goto msbuildPathNotFound

echo Cloning Osiris repository
git clone "https://github.com/danielkrupinski/Osiris.git"
if not exist %CD%/Osiris/Osiris.sln goto osirisCloneFail

echo Building Osiris
%MSBuildPath% "%CD%/Osiris/Osiris.sln" -property:Configuration=Release


echo Cloning Shtreeba repository
git clone "https://github.com/mdilai/Shtreeba.git"
if not exist %CD%/Shtreeba/Shtreeba.sln goto shtreebaCloneFail

echo Building Shtreeba
%MSBuildPath% "%CD%/Shtreeba/Shtreeba.sln" -property:Configuration=Release

echo Osiris installed successfully. Please shutdown steam, run "VAC Bypass.exe", open CSGO and run "run.bat"

pause
exit

:msbuildPathNotFound
echo MSBuild was not found, please manually update the path in the install script.
pause
exit
:osirisCloneFail
echo Cloning Osiris repository failed. Please make sure GIT CLI is installed.
pause
exit
:shtreebaCloneFail
echo Cloning Osiris repository failed. Please make sure GIT CLI is installed.
pause
exit