
# Osiris Installer and Automatic Updater

Two simple batch scripts to install and update 
[Osiris](https://github.com/danielkrupinski/Osiris), a free and open-source CSGO hack.
 These scripts also automatically inject the hack using 
 [Shtreeba](https://github.com/mdilai/Shtreeba). 
 The scripts use [MSBuild](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild?view=vs-2022) which is included with Visual Studio.


## Usage

install.bat will clone the Osiris and Shtreeba repositories. 
It will then build the projects using MSBuild.

run.bat will pull the Osiris and Shtreeba source code and rebuild. 
It then runs Shtreeba to inject Osiris.

VAC Bypass.exe will bypass VAC. This should be run with steam closed.

### To run Osiris:

1. Run install.bat to initially clone and build Osiris
2. Close Steam and run VAC Bypass.exe
3. Open CSGO
4. Run run.bat to update, build and inject Osiris
