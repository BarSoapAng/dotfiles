# Dotfile setup
# function dotfiles { & git --git-dir="$HOME/.dotfiles/.git" @args }

# Navigation
function b { Set-Location .. }
function home { Set-Location ~ }
function oa { notepad "$HOME\.dotfiles\powershell\.aliases.ps1" }
function sz { . $PROFILE }

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

