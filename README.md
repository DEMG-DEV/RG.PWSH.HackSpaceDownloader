# MagPiDownloader for Windows

Downloads all the HackSpace issues (a HackSPace magazine) on Windows

Open your Powershell as Administrator (right click on PowerShell -> Open as Administrator)
Enter: `set-executionpolicy remotesigned`
and you are able to use the Powershell scripts.
The original Windows scripts was programmed by [GitHub user Rubemlrm](https://github.com/Rubemlrm)
and based on: [GitHub user joergi](https://github.com/joergi)
The new rewritten code is now programmed by [GitHub user DEMG-DEV](https://github.com/DEMG-DEV)


  `git clone https://github.com/DEMG-DEV/RG.PWSH.HackSpaceDownloader.git`

Download the normal issues:
  `./hs-issue-downloader.ps1`

Download a specific range of normal issues:
  `./hs-issue-downloader.ps1 -f 42 -l 52`

=======
All the issues are downloadable for free on [https://www.raspberrypi.org/magpi/issues/](https://www.raspberrypi.org/magpi/issues/)
You can also buy all the paper versions of this issues on [https://swag.raspberrypi.org/collections/magpi](https://swag.raspberrypi.org/collections/magpi)