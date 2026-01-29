$Users   = Import-Csv "$PSScriptRoot\users.csv"
$Results = @()

Write-Host "Loaded $($Users.Count) users from CSV"
Write-Host "PSScriptRoot is: $PSScriptRoot"

foreach ($User in $Users) {

    # 1. Generate a random 12-character password
    $CharSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
    $RandomPassword = -join ((1..12) | ForEach-Object {
        $CharSet[(Get-Random -Maximum $CharSet.Length)]
    })

    # 2. Convert to Secure String
    $SecurePassword = ConvertTo-SecureString $RandomPassword -AsPlainText -Force

    try {
        # 3. Create the user
        New-ADUser `
            -Name $User.Name `
            -Surname $User.LastName `
            -SamAccountName $User.SamAccountName `
            -Path $User.OUPath `
            -AccountPassword $SecurePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        # 4. Add to the group
        try {
            Add-ADGroupMember `
                -Identity $User.GroupName `
                -Members $User.SamAccountName
        }
        catch {
            Write-Warning "User $($User.SamAccountName) created, but failed to add to group $($User.GroupName): $($_.Exception.Message)"
        }

        # 5. Record the result
        $Results += [PSCustomObject]@{
            Name     = $User.Name
            LastName = $User.LastName
            Username = $User.SamAccountName
            Password = $RandomPassword
            Status   = "Success"
        }
    }
    catch {
        $Results += [PSCustomObject]@{
            Name     = $User.Name
            LastName = $User.LastName
            Username = $User.SamAccountName
            Password = "N/A"
            Status   = "Error: $($_.Exception.Message)"
        }
    }
}

# 6. Export results to a new file in VSCode folder
$Results | Export-Csv "$PSScriptRoot\UserCreation_Results.csv" -NoTypeInformation
