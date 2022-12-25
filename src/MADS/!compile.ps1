# Load functions
. .\xex-analyzer.ps1
. .\compare.ps1

# Compile 
. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' '.\src\MADS\!main.asm'
$fileorg = Resolve-Path ".\src\MADS\!main.obx"
$filexex = $fileorg -replace '.obx','.xex'
Remove-Item $filexex -ErrorAction 'SilentlyContinue'
Rename-Item $fileorg $filexex 

# Analyze file
#Measure-xexFile ".\src\C64S\Release\dc.xex"
Measure-xexFile ".\src\QA\bin\DANGEROUS.xex"
Measure-xexFile ".\src\MADS\!main.xex"

# Compare
Compare-BinFiles
