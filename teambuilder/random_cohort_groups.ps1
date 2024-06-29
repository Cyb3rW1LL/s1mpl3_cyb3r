# Author: Cyb3rW1LL
# Date: 6/28/2024

# Get current execution policy
$Policy = Get-ExecutionPolicy

# Set execution policy to bypass temorarily
#Set-ExecutionPolicy Bypass

# Launch as Administrator due to permission requirement
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    # Create a new process to run the script as Administrator
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"";
    $newProcess.Verb = "runas";
    
    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess) | Out-Null;
    
    # Exit the current condition
    exit;
}

# Array to hold CCS08 teamnames
$names = @("Name1", "Name2", "Name3", "Name4", "Name5", "Name6", "Name7", "Name8", "Name9", "Name10", "Name11")

# Get Mrs. Lupe's input to split up teams (recommend groups of 3 to 4)
$teams = Read-Host "Split CCS08 into teams of "

# This will shuffle the array of names in to a random ordered array
for ($i = $names.Length - 1; $i -gt 0; $i--) {
    $v = Get-Random -Minimum 0 -Maximum ($i + 1)
    $temp = $names[$i]
    $names[$i] = $names[$v]
    $names[$v] = $temp
} 
# This will test print the shuffled names
#$names

# This loop will iterate through the names and the indexes to print names in groups of the number specified
$count = 0
for ($i = 0; $i -lt $names.Length; $i+=$teams){
    $count += 1
    Write-Host "**********"
    for ($v = 0; $v -lt $teams; $v++){
        $index = $i + $v
        if ($index -lt $names.Length) {
            Write-Host "Team $count"$names[$index]
        }
    }
} Write-Host "**********"

Write-Host "Copy the teams to a notepad or to the teams chat before pressing 'ENTER'"

# Wait for enter signal to exit script
Read-Host -Prompt "Press Enter to close"

# Reset execution policy
Set-ExecutionPolicy $Policy
