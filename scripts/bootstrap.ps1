param(
    [Parameter(Position = 0)]
    [string]$TargetPath = ".",

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $repoRoot "templates"

if ([System.IO.Path]::IsPathRooted($TargetPath)) {
    $targetRoot = [System.IO.Path]::GetFullPath($TargetPath)
}
else {
    $targetRoot = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $TargetPath))
}

$files = @("AGENTS.md", "PROJECT.md", "ARCHITECTURE.md", "DECISIONS.md", "TODO.md")

New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null

$copied = 0
$skipped = 0

foreach ($file in $files) {
    $source = Join-Path $templateRoot $file
    $destination = Join-Path $targetRoot $file

    if ((Test-Path $destination) -and -not $Force) {
        Write-Host "SKIP  $file (already exists)"
        $skipped++
        continue
    }

    Copy-Item -Path $source -Destination $destination -Force
    Write-Host "COPY  $file"
    $copied++
}

Write-Host ""
Write-Host "Bootstrap complete: $copied copied, $skipped skipped."
Write-Host "Target: $targetRoot"

if ($skipped -gt 0 -and -not $Force) {
    Write-Host "Existing files were left untouched. Use -Force only if you intend to replace them."
}
