# auto-nvm.ps1
# This is AI generated and NOT checked for correctness! The bash script is ideal
function nvmup {
    if (-not (Get-Command nvm -ErrorAction SilentlyContinue)) {
        return
    }

    $nvmrcPath = Join-Path (Get-Location).Path '.nvmrc'
    if (-not (Test-Path -LiteralPath $nvmrcPath -PathType Leaf)) {
        return
    }

    $requiredRaw = (Get-Content -LiteralPath $nvmrcPath -Raw).Trim()
    if ([string]::IsNullOrWhiteSpace($requiredRaw)) {
        return
    }

    $required = $requiredRaw.TrimStart('v', 'V')

    $nodeVersion = ''
    try {
        $nodeVersion = (& node -v 2>$null).Trim()
    } catch {
        $nodeVersion = ''
    }

    $current = if ($nodeVersion) { $nodeVersion.TrimStart('v', 'V') } else { '' }

    if ($current -ne $required) {
        nvm install $required | Out-Null
        nvm use $required | Out-Null

        $activeVersion = ''
        try {
            $activeVersion = (& node -v 2>$null).Trim()
        } catch {
            $activeVersion = ''
        }

        if ($activeVersion) {
            Write-Host "Switched Node to $activeVersion (from $nvmrcPath)"
        }
    }
}
