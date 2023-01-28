# Load functions
. ./xex-analyzer.ps1
. ./compare.ps1

. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' '.\src\MADS\test\title.asm'
Measure-xexFile ".\test\title.obx"

# Compile game
. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' 'src\MADS\!main.asm' -o:'src\MADS\bin\!main.obx'
. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' 'src\MADS\!main.asm' -o:'src\MADS\bin\!DC2023_128_pl.obx'
Measure-xexFile "src\MADS\bin\!main.obx"

. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' 'src\MADS\loader.asm'
Measure-xexFile "src\MADS\loader.obx"

$fileorg = Resolve-Path "src\MADS\!main.obx"
$filexex = $fileorg -replace '.obx','.xex'
Remove-Item $filexex -ErrorAction 'SilentlyContinue'
Copy-Item $fileorg $filexex 
#Rename-Item $fileorg $filexex 

# Analyze file
#Measure-xexFile ".\src\C64S\Release\dc.xex"
Measure-xexFile ".\src\QA\bin\DANGEROUS.xex"
Measure-xexFile ".\src\MADS\!main.xex"

# Compare
Compare-BinFiles

# Compile new title only
. 'd:\ATARI\Tools\Mad-Assembler-2.1.5\mads.exe' '.\src\MADS\newgfx\TYT10_PTODT4.asm'
Measure-xexFile "src\MADS\newgfx\TYT10_PTODT4.xex"
Measure-xexFile "src\MADS\newgfx\TYT10_PTODT4.obx"

