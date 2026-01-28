
# First, disable the protection of HR OU
Set-ADOrganizationalUnit -Identity "OU=HR,OU=Groups,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the HR OU
Remove-ADOrganizationalUnit -Identity "OU=HR,OU=Groups,DC=infrait,DC=sec" -Confirm:$false



# First, disable the protection of Groups OU
Set-ADOrganizationalUnit -Identity "OU=Groups,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the Groups OU
Remove-ADOrganizationalUnit -Identity "OU=Groups,DC=infrait,DC=sec" -Confirm:$false


# First, disable the protection of TestOU
Set-ADOrganizationalUnit -Identity "OU=TestOU,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the TestOU
Remove-ADOrganizationalUnit -Identity "OU=TestOU,DC=infrait,DC=sec" -Confirm:$false


# First, disable the protection of InfraIT_Users
Set-ADOrganizationalUnit -Identity "OU=InfraIT_Users,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the InfraIT_Users
Remove-ADOrganizationalUnit -Identity "OU=InfraIT_Users,DC=infrait,DC=sec" -Confirm:$false

# First, disable the protection of InfraIT_Users
Set-ADOrganizationalUnit -Identity "OU=ChildOU, OU=ParentOU,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the InfraIT_Users
Remove-ADOrganizationalUnit -Identity "OU=ChildOU, OU=ParentOU,DC=infrait,DC=sec" -Confirm:$false

# First, disable the protection of InfraIT_Users
Set-ADOrganizationalUnit -Identity "OU=ParentOU,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the InfraIT_Users
Remove-ADOrganizationalUnit -Identity "OU=ParentOU,DC=infrait,DC=sec" -Confirm:$false