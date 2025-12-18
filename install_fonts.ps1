# Skrypt do instalacji Hack Nerd Font
$tempDir = "$env:TEMP\HackNerdFont"
New-Item -ItemType Directory -Force -Path $tempDir

$urls = @(
    "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf",
    "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Bold/HackNerdFont-Bold.ttf"
)

foreach ($url in $urls) {
    $filename = Split-Path $url -Leaf
    Invoke-WebRequest -Uri $url -OutFile (Join-Path $tempDir $filename)
}

$shellApp = New-Object -ComObject Shell.Application
$fontFolder = $shellApp.Namespace(0x14)
Get-ChildItem $tempDir -Filter *.ttf | ForEach-Object { $fontFolder.CopyHere($_.FullName, 0x10) }

Write-Host "✅ Hack Nerd Font zainstalowana!" -ForegroundColor Green
