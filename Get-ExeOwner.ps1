<#
Get-ExeOwner.ps1
Author: Devon Finnerty-Burelle
Due Date: March 14th 2022
Requires: Version 5.1
	  Modules Microsoft.Powershell.Management, Microsoft.Powershell.Security
Goal: 
- Receive input from user as a named parameter called "proc" that is the process for which to find the executable owner.
- Find the path of the process and determine the security owner at the path
- Must output file path and the owner of executable
#>




<# First we need get the input from user#>

Param ([string]$Proc = $(throw "A process name must be specified"))



<# Define a function to get the path to the service or executable #>

function Get-ProcPath {
    Param ($ProcName)
    $ProcPath = get-process -Name $ProcName | select -Unique -expandProperty path
    if ($ProcPath){
        $Procpath
    }
}

<#Define a function to get the owner information on the selected service file #>

function Get-Owner {
    Param ($Paths)
    $owners = @()
    foreach ($Path in $Paths){
        $owners += Get-Acl -Path $path |select -ExpandProperty Owner
    }
    $owners
}

<#Define our custom object that we want to output#>

$ProcPathOwner = [pscustomobject]@{
    process = $proc
    Path = $null
    Owner = $null
}



<#Get path to .EXE file#>
$ProcPathOwner.Path = Get-ProcPath -ProcName $proc

<#Get owner information of file#>
$ProcPathOwner.Owner = Get-Owner -Paths $ProcPathOwner.Path

<#Filter out the "file name" option for output#>
$Output = $ProcPathOwner | Select "Path", "Owner"

<#Write the output of Path to file and Owner of file.#>
Write-Output $Output