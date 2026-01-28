

# First, create the parent OU
New-ADOrganizationalUnit -Name "InfraIT_Users" -Path "DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "InfraIT_Computers" -Path "DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "InfraIT_Groups" -Path "DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then create a child OU inside the parent OU (InfraIT_Users)
New-ADOrganizationalUnit -Name "Finance" -Path "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Sales" -Path "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "IT" -Path "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Consulants" -Path "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "HR" -Path "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then create a child OU inside the parent OU (InfraIT_Computers)
New-ADOrganizationalUnit -Name "Workstation" -Path "OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Servers" -Path "OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false


# Create child OU inside of another child OU 
New-ADOrganizationalUnit -Name "Finance" -Path "OU=Workstation,OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Sales" -Path "OU=Workstation,OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "IT" -Path "OU=Workstation,OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "Consulants" -Path "OU=Workstation,OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "HR" -Path "OU=Workstation,OU=InfraIT_Computers,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

