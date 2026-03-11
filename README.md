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

Powershell setup:

```powershell
Add-Content -Path $PROFILE -Value '. "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"' # Adds the cloned dotfile to powershell profile
. $PROFILE # Sources the dotfile!
```

Check the contents of `$PROFILE`:
```bash
notepad $PROFILE
```