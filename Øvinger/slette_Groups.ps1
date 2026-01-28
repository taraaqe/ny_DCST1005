
# First, disable the protection of HR OU
Set-ADOrganizationalUnit -Identity "OU=HR,OU=Groups,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the HR OU
Remove-ADOrganizationalUnit -Identity "OU=HR,OU=Groups,DC=infrait,DC=sec" -Confirm:$false



# First, disable the protection of Groups OU
Set-ADOrganizationalUnit -Identity "OU=Groups,DC=infrait,DC=sec" -ProtectedFromAccidentalDeletion $false

# Then delete the Groups OU
Remove-ADOrganizationalUnit -Identity "OU=Groups,DC=infrait,DC=sec" -Confirm:$false