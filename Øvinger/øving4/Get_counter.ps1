# Analogt med en funksjon, men mer fleksibel
$scriptblock = { Write-Host "Dette kjøres ikke ennå!" }

# Kjør scriptet
& $scriptblock  # Output: Dette kjøres ikke ennå!