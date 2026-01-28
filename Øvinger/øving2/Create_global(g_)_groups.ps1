# First im going to create multiple global groups usin an array

# Define your groups with their properties
$groups = @(
    @{
        Name = "IT"
        Path = "OU=global,OU=InfraIT_Groups,DC=InfraIT,DC=sec"
        Scope = "Global"
        Category = "Security"
    },
    @{
        Name = "HR"
        Path = "OU=global,OU=InfraIT_Groups,DC=InfraIT,DC=sec"
        Scope = "Global"
        Category = "Security"
    },
    @{
        Name = "Finance"
        Path = "OU=global,OU=InfraIT_Groups,DC=InfraIT,DC=sec"
        Scope = "Global"
        Category = "Security"
    }
    @{
        Name = "Consulant"
        Path = "OU=global,OU=InfraIT_Groups,DC=InfraIT,DC=sec"
        Scope = "Global"
        Category = "Security"
    }
    @{
        Name = "Sales"
        Path = "OU=global,OU=InfraIT_Groups,DC=InfraIT,DC=sec"
        Scope = "Global"
        Category = "Security"
    }
)

# Create each group
foreach ($group in $groups) {
    New-ADGroup -Name $group.Name `
        -GroupScope $group.Scope `
        -GroupCategory $group.Category `
        -Path $group.Path
}
