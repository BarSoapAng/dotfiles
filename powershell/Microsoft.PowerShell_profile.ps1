# Dotfile setup
# function dotfiles { & git --git-dir="$HOME/.dotfiles/.git" @args }

# Navigation
function Open-DotfilePath {
  param([Parameter(Mandatory = $true)][string]$Path)
  Invoke-Item -LiteralPath $Path
}

function b { Set-Location .. }
function home { Set-Location ~ }
function od { Open-DotfilePath "$HOME\.dotfiles" }
function oa { notepad "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1" }
function sz { . $PROFILE }
function dotp {
  if ($args.Count -eq 0) {
    Write-Error "Usage: dotp <commit message>"
    return
  }

  $message = $args -join ' '

  Push-Location "$HOME\.dotfiles"
  try {
    git add .
    if ($LASTEXITCODE -ne 0) { return }

    git commit -m $message
    if ($LASTEXITCODE -ne 0) { return }

    git push
  }
  finally {
    Pop-Location
  }
}

# Linting
function lint { npx eslint --fix $args }

# Git branches
function gitc { git checkout $args }
function gitcm {
  $r = if ($script:remote) { $script:remote } else { 'origin' }
  $head = git symbolic-ref "refs/remotes/$r/HEAD" 2>$null
  $branch = $head -replace '^.*/', ''
  git checkout $branch @args
}
function gitb { git branch }
function gitbd { git branch -D $args }
function gitcb { git checkout -b $args }
function gitr { git reset $args }
function gitrh { git reset --hard $args }
function gitrm {
  $r = if ($script:remote) { $script:remote } else { 'origin' }
  $head = git symbolic-ref "refs/remotes/$r/HEAD" 2>$null
  $branch = $head -replace '^.*/', ''
  git rebase $branch
}
function gitrc { git rebase --continue }
function gitl { git log }

# Git changes
function gitp { git pull }
function gitpm { git checkout main; git pull }
function gs { git status }
function ga { git add $args }
function gaa { git add . }
function grs { git restore --staged $args }
function gc { git commit -m $args }
function gac { git commit -am $args }
function gaac { git add .; git commit -m $args }
function gp { 
    $branch = git branch --show-current
    git push origin $branch $args
}
function gpf { gp --force-with-lease }

$autoNvmScript = "$HOME\.dotfiles\scripts\powershell\auto-nvm.ps1"
if (Test-Path -LiteralPath $autoNvmScript) {
    . $autoNvmScript
    nvmup
}

# For agents :3
function agentgc {
  $env:GIT_AUTHOR_NAME = "soapyang"
  $env:GIT_COMMITTER_NAME = "soapyang"
  git commit @args
}