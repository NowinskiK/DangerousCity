$orgFile = ".\srcQA\bin\DANGEROUS.xex"
$newFile = ".\srcPC\Release\DC.xex"

$org = [System.IO.File]::ReadAllBytes($orgFile)
$new = [System.IO.File]::ReadAllBytes($newFile)

$orgStart = 0x6d0b
$newStart = 0x9010
$newStart = 0x9b09
$addr = 0xA000
$i=0
$fc=0

do {
    $newLine = ($new[($i+$newStart)..($newStart+15+$i)]|ForEach-Object ToString X2) -join ' '
    $orgLine = ($org[($i+$orgStart)..($orgStart+15+$i)]|ForEach-Object ToString X2) -join ' '
    if ($orgLine -ne $newLine) 
    { 
        $fc++ 
        Write-Host ("{0:X8} : $orgLine   $newLine    $($orgLine -eq $newLine)" -f ($addr+$i))
    } 
    $i += 16
} until ( $fc -eq 4 )





## Show body
$i=0
$lines=0
$orgStart = 0x8d59-176
do {
    $orgLine = ($org[($i+$orgStart)..($orgStart+15+$i)]|ForEach-Object ToString X2) -join ' '
    Write-Host ("     !hex  $orgLine   ")
    $i += 16
    $lines++
} until ( $lines -eq 12 )

