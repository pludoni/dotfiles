
```
git clone https://github.com/pludoni/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```


## 1. symlink *rc + configs

```
make link
```

* Adjust ~/.gitconfig - add your name/email

## 2. Tmux resurrect:

```
make tmux
```

## 3. install vimfiles

```
make vimfiles
```

## 4. install pludoni zsh

```
make zsh
```

## 5. When on OSX:

```
brew bundle  --file="~/.dotfiles/Brewfile"
```
