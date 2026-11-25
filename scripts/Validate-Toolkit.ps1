[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

$requiredFiles = @(
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

$errors = [System.Collections.Generic.List[string]]::new()
foreach ($relativePath in $requiredFiles) {
    $path = Join-Path $root $relativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $errors.Add("Missing required file: $relativePath")
    }
}

$agentFiles = Get-ChildItem -LiteralPath (Join-Path $root '.github/agents') -Filter '*.agent.md' -File
foreach ($file in $agentFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    if ($content -notmatch '(?s)\A---\r?\n.*?\r?\n---\r?\n') {
        $errors.Add("Invalid or missing YAML front matter: $($file.Name)")
        continue
    }
    if ($content -notmatch '(?m)^name:\s*\S' -or $content -notmatch '(?m)^description:\s*\S') {
        $errors.Add("Agent front matter requires name and description: $($file.Name)")
    }
}

$skillFiles = Get-ChildItem -LiteralPath (Join-Path $root '.github/skills') -Filter 'SKILL.md' -Recurse -File
$skillNames = [System.Collections.Generic.List[string]]::new()
foreach ($file in $skillFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    if ($content -notmatch '(?s)\A---\r?\n.*?\r?\n---\r?\n') {
        $errors.Add("Invalid or missing YAML front matter: $($file.FullName.Substring($root.Length + 1))")
        continue
    }
    if ($content -notmatch '(?m)^name:\s*[a-z0-9-]+\s*$' -or $content -notmatch '(?m)^description:\s*\S') {
        $errors.Add("Skill front matter requires a kebab-case name and description: $($file.FullName.Substring($root.Length + 1))")
    }
    $nameMatch = [regex]::Match($content, '(?m)^name:\s*([a-z0-9-]+)\s*$')
    if ($nameMatch.Success) {
        $skillNames.Add($nameMatch.Groups[1].Value)
    }
}

$agentNames = [System.Collections.Generic.List[string]]::new()
$agentContents = @{}
$agentFiles | ForEach-Object {
    $content = Get-Content -LiteralPath $_.FullName -Raw
    $nameMatch = [regex]::Match($content, '(?m)^name:\s*(.+?)\s*$')
    if ($nameMatch.Success) {
        $agentNames.Add($nameMatch.Groups[1].Value)
    }
    $agentContents[$_.Name] = $content
    $skillListMatch = [regex]::Match($content, '(?m)^skills:\s*\[(.*?)\]\s*$')
    if ($skillListMatch.Success) {
        $referencedSkills = [regex]::Matches($skillListMatch.Groups[1].Value, "['""]([^'""]+)['""]")
        foreach ($referencedSkill in $referencedSkills) {
            if (-not $skillNames.Contains($referencedSkill.Groups[1].Value)) {
                $errors.Add("Unknown skill '$($referencedSkill.Groups[1].Value)' referenced by $($_.Name)")
            }
        }
    }
}

$coordinator = Get-Content -LiteralPath (Join-Path $root '.github/agents/sdlc-coordinator.agent.md') -Raw
foreach ($agentName in @('Requirements Analyst', 'Architecture Specialist', 'Implementation Specialist', 'Quality Specialist', 'Review Specialist')) {
    if (-not $agentNames.Contains($agentName) -or $coordinator -notmatch [regex]::Escape("agent: $agentName")) {
        $errors.Add("Coordinator handoff missing agent: $agentName")
    }
}

foreach ($markdownFile in (Get-ChildItem -LiteralPath $root -Filter '*.md' -Recurse -File)) {
    $content = Get-Content -LiteralPath $markdownFile.FullName -Raw
    foreach ($link in [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')) {
        $target = $link.Groups[1].Value
        if ($target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $target.StartsWith('#')) {
            continue
        }
        $targetPath = ($target -split '#', 2)[0]
        if ($targetPath -and -not (Test-Path -LiteralPath (Join-Path $markdownFile.DirectoryName $targetPath))) {
            $errors.Add("Broken local Markdown link in $($markdownFile.FullName.Substring($root.Length + 1)): $target")
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    throw "Toolkit validation failed with $($errors.Count) error(s)."
}

Write-Output ("Validated {0} required files, {1} agent definitions, and {2} skills." -f $requiredFiles.Count, $agentFiles.Count, $skillFiles.Count)
