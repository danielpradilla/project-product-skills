$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$Target = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME ".claude\skills" }

New-Item -ItemType Directory -Force -Path $Target | Out-Null

Get-ChildItem (Join-Path $Root "skills") -Directory | ForEach-Object {
    $Dest = Join-Path $Target $_.Name
    if (Test-Path $Dest) {
        Remove-Item $Dest -Recurse -Force
    }
    Copy-Item $_.FullName $Dest -Recurse
}

Write-Host "Installed Project + Product skills into $Target"
Write-Host "Restart Claude Code so it can reload the skill list."

