# Local Development Setup Scripts

> Common Developer Scripts and Settings for Local Development. Happy hacking!

## What does it do?
<hr>

Local scripts is designed to eliminate fiddling and wasting precious developer time on scripts to either connect to other boxes or configure their terminal settings in cool ways.

Just wanted to start tracking some local scripts and settings to get developer experience going faster

## What you need installed?

<hr>

_Only writing this for Debian/Ubuntu._

_If you're a Fedora/REHL/Arch user, you already know more than I do_

### Ubuntu/Debian Linux 
First get your packages up to date

```sh
sudo apt update && sudo apt upgrade -y
```

To install dialog run this:

```sh
sudo apt install -y dialog
```

To install TMUX

```sh
sudo apt install tmux

```

To install ZSH and oh-my-zsh

```sh
sudo apt install curl && \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

change your local terminal to zsh by running `chsh -s $(which zsh)` or

```sh
# Open /etc/passwd:

sudo vi /etc/passwd

# Find the line with your username:

username:x:1634231:100:Your Name:/home/username:/bin/bash
# and replace bash with zsh:

username:x:1634231:100:Your Name:/home/username:/bin/zsh
```
Log out and log in back for the changes to take effect.

### Mac OS 
First get your packages up to date

```sh
brew update && brew upgrade
```

To install dialog run this:

```sh
brew install dialog
```

To install TMUX

```sh
brew install tmux

```

To install ZSH and oh-my-zsh

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

change your local terminal to zsh by running
```
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
```

```sh
# Open /etc/passwd:

sudo vi /etc/passwd

# Find the line with your username:

username:x:1634231:100:Your Name:/home/username:/bin/bash
# and replace bash with zsh:

username:x:1634231:100:Your Name:/home/username:/bin/zsh
```
Log out and log in back for the changes to take effect.

> From here on forward I highly encourage you to go through each script file and update the paths.

### Script runner

Script runner is a basic toolkit we designed to hold all our ssh connection commands in one place.

It's used to:

- jump into other dev boxes
- copy your local or external ip
- open the SSH tunnel setup

### Tunnel super charger

Our current development architecture depends on a number of things and depending on what you're working on, you may not want to setup complete projects on your local machine. It's best to use the running services in one of the dev boxes.

The tunnel setup uses the dialog select box to enable or disable ssh connections

To run this you can call the tunnel script [start-tunnel](./tunnel-scripts/runner.sh)

### ZSH

Use the `.zshrc` in the [zsh-setup](./zsh-scripts/.zshrc) folder and replace your local zsh config by running this command

```sh
cp ./zshrc-setup/.zshrc ~/.zshrc
```

### BASH

Use the `.bashrc` in the [bash-setup](./bash-scripts/.bashrc) folder and replace your local zsh config by running this command

```sh
cp ./bash-setup/.bashrc ~/.bashrc
```

You may not see the file on doing `ls` because it's hidden. Instead run `ll -a | grep .zshrc`


### TMUX

TMUX is a great advanced dev tool for split screen and fast window switching.

Use the `.tmux.conf` in the [tmux-setup](./tmux-setup/.tmux.conf) folder and replace your local tmux config by running this command

```sh
cp ./tmux-setup/.tmux.conf ~/.tmux.conf
```

You can use tmux-powerline and the provided [tmux-colors](./tmux/tmux_colors.sh) file to fully customize your terminal screen.

The provided tmux config will allow you to use your mouse to scroll on panels, resize panels and right click for fast split-panes.

The prefix I setup is `C-a` (C means ctrl or control in mac)

Copying text from terminal to clipboard use

- mouse scroll to activate copy mode
- drag and highlight text
- press enter to copy

For copy I'm using `pbcopy`

### Editor settings

Make sure to copy the settings we added here to the editor of your choice settings

<hr>

## Foot notes

A pro dev move would be to symlink the scripts to your home directory so you don't need to change directories every time.

Feel free to change/add anything from the scripts to improve your workflow as I did for mine. Use this README to enlighten other devs.

For security reasons, SSH keys are not provided so you may need to ask any other dev for all keys used.

If you plan on using your own SSH key on any of the dev boxes or your local with multiple SSH keys, I highly recommend using the [ssh-scripts/config](./ssh-scripts/config) file as a guide on how to organize your keys.