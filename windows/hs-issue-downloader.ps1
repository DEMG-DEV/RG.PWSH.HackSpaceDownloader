<#
.SYNOPSIS
    Downloader for all Hackspace issues
.DESCRIPTION
    The HackSpace issues are downloadable for free under https://hackspace.raspberrypi.org/issues/
    or you can buy the paper issues under: https://hackspace.raspberrypi.org/issues/
.NOTES
    This script is under GNU GENERAL PUBLIC LICENSE
    Orignal author: Rubemlrm - https://github.com/Rubemlrm
    and based on: joergi - https://github.com/joergi
    The new rewritten code is now programmed by [Author](https://github.com/DEMG-DEV)
    Script is part of https://github.com/joergi/MagPiDownloader
#>
[CmdletBinding()]
param(
    [string]$FirstIssue = "1",
    [string]$LastIssue
)
[uri]$baseUrl = "https://hackspace.raspberrypi.org/issues/"

# control variables
$baseDir = Split-Path -Path $PSScriptRoot -Parent
if (!$LastIssue) {
    $LastIssue = Get-Content "$baseDir\sources-for-download\hs-regular-issues.txt" -First 1
}

$downloadDir = Join-Path $baseDir "issues"

# Check if directory dont exist and try create
if (!(Test-Path -Path $downloadDir)) {
    $null = New-Item -ItemType Directory -Path $downloadDir -ErrorAction Stop
}

$errorCount = 0
foreach ($issue in $FirstIssue..$LastIssue) {
    $uri = [uri]::new($baseurl, "{0:00}/pdf/download" -f $issue)
    Write-Verbose -Message "Downloading $uri"
    if (($link = (Invoke-WebRequest -UseBasicParsing $uri).Links.Where{ $_.class -eq "c-link" }.href)) {
        $nuri = $link.split(" ")[1]        
        $uri = [uri]::new([uri]"https://hackspace.raspberrypi.com/", $nuri)
        try {
            Write-Information "Downloading $uri"
            Write-Output "Downloading $uri"
            Invoke-WebRequest $uri -OutFile (Join-Path $downloadDir "HackSpace_$issue.pdf") -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed downloading $uri"
            Get-Error | Out-String | Write-Verbose -Verbose
            $errorCount++
        }
    }
    else {
        Write-Warning "Failed to find link for issue $issue"
        $errorCount++
    }
}

if ($errorCount -gt 0) {
    exit 1
}
