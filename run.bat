@echo off
title Osiris Multihack

set MSBuildPath="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
if not exist %MSBuildPath% goto msbuildPathNotFound

set installPath=%CD%


echo "Please make sure VAC Bypass is loaded"
pause


echo "Pulling Osiris source from github"
cd "%installPath%/Osiris/"
git pull

echo "Pulling Shtreeba source from github"
cd "%installPath%/Shtreeba/"
git pull


cd "%installPath%"

echo "Building Osiris"
%MSBuildPath% "%installPath%\Osiris\Osiris.sln" -property:Configuration=Release

echo "Building Shtreeba"
%MSBuildPath% "%installPath%\Shtreeba\Shtreeba.sln" -property:Configuration=Release


echo "Writing Shtreeba configuration"
cd "%installPath%\Shtreeba\Release\"

echo [Library] > Shtreeba.ini
echo DLL="%installPath%\Osiris\Release\Osiris.dll" >> Shtreeba.ini
echo ProcessName=csgo.exe >> Shtreeba.ini
echo [UI] >> Shtreeba.ini
echo Silent=0 >> Shtreeba.ini
echo CloseDelay=3000 >> Shtreeba.ini

echo "Shtreeba configuration written successfully"

echo "Injecting Osiris"
Shtreeba.exe

exit
:msbuildPathNotFound
echo MSBuild was not found, please manually update the path in the run script.
pause
exit
