$header_len = 6
$File = ".\srcPC\fonty\mirage.fnt";
$TargetFile = ".\srcPC\fonty\mirage.chr"

$b = [System.IO.File]::ReadAllBytes($File)
$len = $b.Length
$block = $b[$header_len..($len - 1)] 
[System.IO.File]::WriteAllBytes($TargetFile, $block)


