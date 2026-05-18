$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$Errors = 0

function Fail($Message) {
    Write-Error "FAIL: $Message" -ErrorAction Continue
    $script:Errors += 1
}

function Pass($Message) {
    Write-Host "PASS: $Message"
}

$SkillsRoot = Join-Path $Root "skills"
if (Test-Path $SkillsRoot) { Pass "skills directory exists" } else { Fail "skills directory is missing" }

$Count = 0
Get-ChildItem $SkillsRoot -Directory | ForEach-Object {
    $Count += 1
    $File = Join-Path $_.FullName "SKILL.md"
    if (-not (Test-Path $File)) {
        Fail "$($_.Name) is missing SKILL.md"
        return
    }

    $Text = Get-Content $File -Raw
    $Name = if ($Text -match "(?m)^name:\s*(.+)$") { $Matches[1].Trim() } else { "" }
    $Description = if ($Text -match "(?m)^description:\s*(.+)$") { $Matches[1].Trim() } else { "" }

    if ($Name -ne $_.Name) { Fail "$($_.Name) has name '$Name'" }
    if (-not $Description) { Fail "$($_.Name) is missing description" }
}

if ($Count -gt 0) { Pass "$Count skills found" } else { Fail "no skills found" }

@(
    ".codex-plugin\plugin.json",
    ".claude-plugin\plugin.json",
    ".claude-plugin\marketplace.json",
    "gemini-extension.json"
) | ForEach-Object {
    $File = Join-Path $Root $_
    if (-not (Test-Path $File)) {
        Fail "missing $_"
        return
    }
    try {
        Get-Content $File -Raw | ConvertFrom-Json | Out-Null
        Pass "$_ parses"
    } catch {
        Fail "$_ does not parse"
    }
}

if (Get-ChildItem $Root -Recurse -Force -Filter ".DS_Store" | Select-Object -First 1) {
    Fail ".DS_Store files found"
} else {
    Pass "no .DS_Store files"
}

$Files = Get-ChildItem $Root -Recurse -File | Where-Object {
    $_.FullName -notmatch "\\.git[\\/]" -and
    $_.Name -notin @("validate.sh", "validate.ps1")
}
$Stale = Select-String -Path $Files.FullName -Pattern "product-codex-skills|product-gemin-skills|career-story|role-scorecard" -ErrorAction SilentlyContinue
if ($Stale) {
    $Stale | ForEach-Object { Write-Host $_ }
    Fail "stale names found"
} else {
    Pass "no stale split-repo names found"
}

if ($Errors -gt 0) {
    throw "Validation failed with $Errors error(s)."
}

Write-Host "Validation passed."
