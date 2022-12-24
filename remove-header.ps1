$header_len = 6
$File = ".\srcPC\fonty\b.fnt";
$TargetFile = ".\srcPC\fonty\b-tiles.chr"

$b = [System.IO.File]::ReadAllBytes($File)
$len = $b.Length
$block = $b[$header_len..($len - 1)] 
[System.IO.File]::WriteAllBytes($TargetFile, $block)


