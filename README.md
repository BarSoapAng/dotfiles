# My dotfiles :P

Start by cloning into home dir

```bash
git clone https://github.com/BarSoapAng/dotfiles.git ~/.dotfiles
```

Bash setup:

```bash
echo '[ -f ~/.dotfiles/bashrc/.bashrc ] && source ~/.dotfiles/bashrc/.bashrc' >> "$HOME/.bashrc" # Sources the dot file as barrel file
grep -qxF 'source "$HOME/.bashrc"' "$HOME/.bash_profile" || echo 'source "$HOME/.bashrc"' >> "$HOME/.bash_profile" # Main bash profile controller, checks if this line already exists before appending
source "$HOME/.bashrc"
```

Check the contents of `.bashrc`:
```bash
code ~/.bashrc
```

Zsh setup:

```bash
echo '[ -f ~/.dotfiles/zshrc/.aliases ] && source ~/.dotfiles/zshrc/.aliases' >> "$HOME/.zshrc" # Sources the zsh aliases file
source "$HOME/.zshrc"
```

Check the contents of `.zshrc`:
```bash
open ~/.zshrc
```

Powershell setup:

```powershell
Add-Content -Path $PROFILE -Value '. "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"' # Adds the cloned dotfile to powershell profile
. $PROFILE # Sources the dotfile!
```

Check the contents of `$PROFILE`:
```bash
notepad $PROFILE
```

## Commands

### Navigation
```bash
b="cd .."
home="cd ~"
oa="notepad ~/.dotfiles/bashrc/.aliases"
sz="source ~/.bashrc"
```

### Linting
```bash
lint="npx eslint --fix"
```

### Git branch management
```bash
gitc="git checkout"
gitcm="git checkout <default_branch>" 
gitb="git branch"
gitbd="git branch -D"
gitcb="git checkout -b"
gitr="git reset"
gitrh="git reset --hard"
gitrm="git rebase <default_branch>" 
gitrc="git rebase --continue"
gitl="git log"
```

### Git changes
```bash
gitp="git pull"
gs="git status"
ga="git add"
gaa="git add ."
grs="git restore --staged"
gc="git commit -m"
gac="git commit -am"
gaac="git add . && git commit -m"
gp="git push -u origin <current_branch>"
gpf="gp --force-with-lease"
```

### Other
```bash
nvmup # Updates nvm using .nvmrc in current directory
```
