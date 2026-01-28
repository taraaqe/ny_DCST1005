function New-BulkADUsers {
    param(
        [Parameter(Mandatory)]
        [string]$CsvPath,
        [Parameter(Mandatory)]
        [string]$Domain,
        [Parameter(Mandatory)]
        [string]$BasePath,  # Example: "OU=Users,DC=domain,DC=com"
        [string]$LogPath = "user_creation_log.txt"
    )
    
    # Import CSV
    $users = Import-Csv -Path $CsvPath
    
    # Initialize log
    $log = @()
    
    foreach ($user in $users) {
        try {
            # Generate username
            $upn = New-StandardUsername -GivenName $user.GivenName `
                                      `
                                      -Surname $user.Surname `
                                      -Domain $Domain
            
            $samAccountName = ($upn -split '@')[0]
            
            # Check if user exists
            if (Test-ADUserExists -SamAccountName $samAccountName) {
                $log += "SKIP: User $samAccountName already exists"
                continue
            }
            
            # Generate random password
            $password = New-RandomPassword
            
            # Prepare user properties
            $userProperties = @{
                SamAccountName       = $samAccountName
                UserPrincipalName   = $upn
                Name                = "$($user.GivenName) $($user.Surname)"
                GivenName           = $user.GivenName
                DisplayName        = "$($user.GivenName) $($user.Surname)"
                Department         = $user.Department
                Title              = $user.Title
                Office             = $user.Office
                AccountPassword    = (ConvertTo-SecureString $password -AsPlainText -Force)
                Enabled            = $true
                ChangePasswordAtLogon = $true
            }
            
            # Get appropriate OU path
            $ouPath = Get-DepartmentOUPath -Department $user.Department `
                                         -BasePath $BasePath `
                                         -CreateIfNotExist
            
            # Add OU path to user properties
            $userProperties['Path'] = $ouPath
            
            # Create user
            New-ADUser @userProperties
            $log += "SUCCESS: Created user $samAccountName in OU $ouPath with password: $password"
        }
        catch {
            $log += "ERROR: Failed to create user from record: $($user.GivenName) $($user.Surname). Error: $_"
        }
    }
    
    # Save log
    $log | Out-File -FilePath $LogPath
}

# Usage example
$basePath = "OU=Users,DC=domain,DC=com"
New-BulkADUsers -CsvPath "users.csv" -Domain "domain.com" -BasePath $basePath