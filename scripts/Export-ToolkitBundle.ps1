[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Destination
)

$ErrorActionPreference = 'Stop'
$sourceRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$sourcePrefix = $sourceRoot.TrimEnd('\') + '\'
$destinationFullPath = [System.IO.Path]::GetFullPath($Destination)

if ($destinationFullPath.TrimEnd('\') -ieq $sourceRoot.TrimEnd('\') -or $destinationFullPath.StartsWith($sourcePrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw 'Destination must not be the toolkit repository or a path inside it.'
}

$sourceProjectPath = Split-Path -Parent $sourceRoot
$sourceProjectPrefix = $sourceProjectPath.TrimEnd('\') + '\'
if ($destinationFullPath.TrimEnd('\') -ieq $sourceProjectPath.TrimEnd('\') -or $destinationFullPath.StartsWith($sourceProjectPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw 'Destination must be outside the source project tree.'
}

$ancestorPath = $destinationFullPath
while ($ancestorPath -and (Test-Path -LiteralPath $ancestorPath)) {
    $ancestor = Get-Item -LiteralPath $ancestorPath -Force
    if (($ancestor.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw "Destination path must not use a symbolic link or reparse point: $ancestorPath"
    }
    $parentPath = Split-Path -Parent $ancestorPath
    if (-not $parentPath -or $parentPath -eq $ancestorPath) {
        break
    }
    $ancestorPath = $parentPath
}

$relativeFiles = @(
    'README.md',
    'context/organizational-context.md',
    'standards/sdlc-level-3.md',
    'standards/project-gap-assessment.md',
    '.github/copilot-instructions.md',
    '.github/agents/sdlc-coordinator.agent.md',
    '.github/agents/requirements-analyst.agent.md',
    '.github/agents/architecture-specialist.agent.md',
    '.github/agents/implementation-specialist.agent.md',
    '.github/agents/quality-specialist.agent.md',
    '.github/agents/review-specialist.agent.md',
    '.github/skills/requirements-analysis/SKILL.md',
    '.github/skills/architecture-assessment/SKILL.md',
    '.github/skills/implementation/SKILL.md',
    '.github/skills/quality-gates/SKILL.md',
    '.github/skills/change-review/SKILL.md',
    'scripts/Validate-Toolkit.ps1',
    'scripts/Export-ToolkitBundle.ps1'
)

foreach ($relativeFile in $relativeFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot $relativeFile) -PathType Leaf)) {
        throw "Allowlisted source file is missing: $relativeFile"
    }
}

if (Test-Path -LiteralPath $destinationFullPath) {
    $destinationItem = Get-Item -LiteralPath $destinationFullPath -Force
    if (-not $destinationItem.PSIsContainer) {
        throw 'Destination exists and is not a directory.'
    }
    if (Get-ChildItem -LiteralPath $destinationFullPath -Force | Select-Object -First 1) {
        throw 'Destination directory must be empty; export never overwrites existing files.'
    }
}

if (-not $PSCmdlet.ShouldProcess($destinationFullPath, "Export $($relativeFiles.Count) allowlisted toolkit files")) {
    return
}

if (-not (Test-Path -LiteralPath $destinationFullPath)) {
    New-Item -ItemType Directory -Path $destinationFullPath | Out-Null
}

foreach ($relativeFile in $relativeFiles) {
    $sourceFile = Join-Path $sourceRoot $relativeFile
    $targetFile = Join-Path $destinationFullPath $relativeFile
    $targetDirectory = Split-Path -Parent $targetFile
    if (-not (Test-Path -LiteralPath $targetDirectory)) {
        New-Item -ItemType Directory -Path $targetDirectory -Force | Out-Null
    }
    Copy-Item -LiteralPath $sourceFile -Destination $targetFile
}

Write-Output ("Exported {0} allowlisted files to {1}" -f $relativeFiles.Count, $destinationFullPath)
