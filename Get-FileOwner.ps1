#Requires -Version 5.1
#Requires -Modules Microsoft.PowerShell.Management, Microsoft.PowerShell.Security

#This script will take an arguement for the file name and the directory it is in
#It will then tell the user who the owner of that file is

Param ([string]$FileName,
       [string]$dir) 


write-host "Validating $dir is a real directory..." -BackgroundColor Black -ForegroundColor Red

$testdir = test-path -path $dir
write-host $testdir

if ($testdir== $True){
cd $dir
} 

else {
write-host "invalid Directory"
exit
}

write-host "Retrieving owner information for $FileName" -BackgroundColor Black -ForegroundColor red

$Filepath = Get-ChildItem -path $FileName -Recurse

write-host "The Path to File is: $Filepath" -BackgroundColor Black -ForegroundColor Red -ErrorAction:SilentlyContinue
$owner = Get-Acl -path $Filename 

Write-host "The File owner is:" -BackgroundColor Black -ForegroundColor Red
Write-Host $owner -BackgroundColor Black -ForegroundColor Red
cd <# Insert Location of script #>