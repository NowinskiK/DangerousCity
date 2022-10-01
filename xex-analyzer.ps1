$File = ".\srcQA\bin\DANGEROUS.xex"; $DiscoverGap = $false
$File = "d:\GitHub\NowinskiK\DangerousCity\srcPC\Release\DC.xex"; $DiscoverGap = $true
#$File = "d:\GitHub\NowinskiK\DangerousCity\srcPC\Release\DC.xex"
#$File = "d:\ATARI\gry\Fred (1991)(L.K. Avalon)(PL)[a1].xex" 
#$File = "d:\ATARI\gry\PJ[128k].xex"
#$File = "d:\ATARI\gry\River Raid\River Raid (v1).xex" 
#$File = "d:\ATARI\gry\Problem Jasia\Problem Jasia (v2,128).xex" 

$save = $true
$save = $false
$b = [System.IO.File]::ReadAllBytes($File)

Write-Host ("File: {0}  (Len={1})" -f $File, $b.Length)
$i=0
$block=0
$gap = $false
do {
    if ($DiscoverGap -and $b[$i] -eq 0x00) {
        # Szukaj kolejnego bloku - to są zera wypełniające przestrzeń między blokami 
        if (!$gap) { Write-Host "  GAP"; $gap = $true }
        $hl = 1
        $len = 0
    }
    else {
        $gap = $false
        $w0 = $b[$i] + $b[$i+1] * 256
        if ($w0 -eq 0xffff) {
            $w1 = $b[$i + 2] + $b[$i + 3] * 256
            $w2 = $b[$i + 4] + $b[$i + 5] * 256
            $hl = 6
        }
        else {
            $w1 = $w0
            $w2 = $b[$i + 2] + $b[$i + 3] * 256
            $hl = 4
        }
        $len = $w2 - $w1 + 1
        Write-Host ("Block #{2}: {0:X4}-{1:X4} | Index = {3:X4} | Len = $hl+$len" -f $w1, $w2, $block, $i)
        if ($save) {
            $currentBlock = $b[$i..($i + $hl + $len-1)] 
            if ($hl -eq 6) #remove ffff
                { $currentBlock = $b[($i+2)..($i + $hl + $len-1)] }
            $fileNameBlock = $File + ("-{0:X4}.bin" -f $w1)
            [System.IO.File]::WriteAllBytes($fileNameBlock, $currentBlock)
        }
        $block++
    }
    $i+=$hl
    $i=$i+$len
} until ( $i -ge $b.Length ) #-or $len -lt 2 )

Write-Host "EOF."
