
#variables
$regionalsettingsURL = "https://raw.githubusercontent.com/itsocamex/AZURE_XML/main/ES_Region.xml"
$RegionalSettings = "C:\Temp\ES_Region.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Set-WinSystemLocale es-ES
Set-WinUserLanguageList -LanguageList es-ES -Force
Set-Culture -CultureInfo es-ES
Set-WinHomeLocation -GeoId 217
Set-TimeZone -Name "Romance Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
