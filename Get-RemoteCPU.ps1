#This script was intended to retrieve the CPU information of a remote PC and print it to an HTML file.



#Asks for arg of the remote PC name
Param ([string] $Remotepc)

#The process of collecting the information
$hostname = Invoke-Command -ComputerName $RemotePC -ScriptBlock {hostname}
$cpuname = Invoke-Command -ComputerName $RemotePC -ScriptBlock {Get-CimInstance Win32_processor | select -ExpandProperty "Name" -first 1}
$CpuSpeed = Invoke-Command -ComputerName $RemotePC -ScriptBlock {(Get-WmiObject win32_processor | Measure-Object -property CurrentClockSpeed -Average | Select Average ).Average}
$CPUload = Invoke-Command -ComputerName $RemotePC -ScriptBlock {(Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average ).Average }

#Stores values in a custom object
$Summary = [PScustomObject]@{
hostname = $hostname
cpuname = $cpuname
cpuspeed = $CpuSpeed
cpuload = $CPUload
date = Get-Date
}

#Defines HTML file and fills in the CPU info
$Table = $Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@



#Creates HTML File
$Summary | ConvertTo-Html $Table | Out-File -FilePath $hostnamecpuinfo.html