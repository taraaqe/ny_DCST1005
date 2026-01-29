# Define department and group names
$department = "Sales"
$groupName = "g_all_Sales"

# Get all users from the department
$departmentUsers = Get-ADUser -Filter {department -eq $department} -Properties department

# Add users to the group
foreach ($user in $departmentUsers) {
    try {
        Add-ADGroupMember -Identity $groupName -Members $user.SamAccountName
        Write-Host "Added $($user.Name) to $groupName"
    }
    catch {
        Write-Host "Error adding $($user.Name): $_"
    }
}




# Define department and group names
$department = "IT"
$groupName = "g_all_IT"

# Get all users from the department
$departmentUsers = Get-ADUser -Filter {department -eq $department} -Properties department

# Add users to the group
foreach ($user in $departmentUsers) {
    try {
        Add-ADGroupMember -Identity $groupName -Members $user.SamAccountName
        Write-Host "Added $($user.Name) to $groupName"
    }
    catch {
        Write-Host "Error adding $($user.Name): $_"
    }
}



# Define department and group names
$department = "Consulants"
$groupName = "g_all_COnsulants"

# Get all users from the department
$departmentUsers = Get-ADUser -Filter {department -eq $department} -Properties department

# Add users to the group
foreach ($user in $departmentUsers) {
    try {
        Add-ADGroupMember -Identity $groupName -Members $user.SamAccountName
        Write-Host "Added $($user.Name) to $groupName"
    }
    catch {
        Write-Host "Error adding $($user.Name): $_"
    }
}



# Define department and group names
$department = "IT"
$groupName = "g_all_IT"

# Get all users from the department
$departmentUsers = Get-ADUser -Filter {department -eq $department} -Properties department

# Add users to the group
foreach ($user in $departmentUsers) {
    try {
        Add-ADGroupMember -Identity $groupName -Members $user.SamAccountName
        Write-Host "Added $($user.Name) to $groupName"
    }
    catch {
        Write-Host "Error adding $($user.Name): $_"
    }
}


Add-ADGroupMember -Identity "g_all_Finance" -Members "Kak"

Add-ADGroupMember -Identity "g_all_HR" -Members "Ita"