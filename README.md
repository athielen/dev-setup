# Config and Environment Setup

## System Preferences

Update your System: 
**Apple menu () > About This Mac > Software Update.**

### Trackpad

- _Point & Click_
    - Enable _Tap to click with one finger_
    - Change _Secondary click_ to _Right corner_
    - Uncheck _Three Finger Drag_
- _Scroll & Zoom_
    - Uncheck _all_ apart from _Zoom in and out_
    - _Invert_ trackpad

### Dock

- _Visual Settings_
    - _Make the size_ of icons _Small_
    - Turn _hiding_ On
- _Other settings_
    - Remove _workspace auto-switching_ by running the following command:

```shell
$ defaults write com.apple.dock workspaces-auto-swoosh -bool NO
$ killall Dock # Restart the Dock process
```

### Finder

- General
    - Change _New finder window show_ to open in your _Home Directory_
- Sidebar
    - Add _Home_ and your _Code Directory_
    - Uncheck all _Shared_ boxes

### Menubar

- Remove the _Display_ icon
- Change _battery_ to _Show percentage symbols_
- Turn _hiding_ on

### Spotlight

- Uncheck _fonts_, _images_, _files_ etc.

### User Defaults

- Enable _repeating keys by pressing and holding down keys_: `defaults write
  NSGlobalDomain ApplePressAndHoldEnabled -bool false` (and restart any app
  that you need to repeat keys in)
- Change the _default folder for screenshots_
    - Open the terminal and create the folder where you would like to store
      your screenshots: `mkdir -p /path/to/screenshots/`
    - Then run the following command: `defaults write com.apple.screencapture
      location /path/to/screenshots/ && killall SystemUIServer`

## Xcode

For installing Xcode command line tools run:

    $ xcode-select --install

## Homebrew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    $ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

Start new shell.

    $ brew doctor

## Iterm2

    $ brew cask install iterm2

    $ brew tap caskroom/fonts && brew cask install font-source-code-pro

    $ brew install tldr

Import json iterm2 profile.

## GIT

    $ brew install git

Copy .gitconfig to ```~/.gitconfig```.

    $ git config --global credential.helper osxkeychain

Copy .gitignore to ```~/.gitignore```.

    $ git config --global core.excludesfile ~/.gitignore

## Bash Completion

    $ brew install bash-completion
    $ echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
    $ brew install apm-bash-completion
    $ brew install bash-completion
    $ brew install docker-completion
    $ brew install docker-compose-completion
    $ brew install docker-machine-completion
    $ brew install maven-completion
    $ brew install brew-cask-completion
    $ brew install zsh-completions
    $ brew install pip-completion

## VIM

        $ brew install vim

## Sublime3

Have to download the dmg :(

    $ ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

Copy over preferences to sublime3.

Install package control:

* Color Highlighter
* Color Sublime
* FileDiffs
* MarkdownEditing
* MarkdownPreview
* SublimeLinter
* Syntax History
* JSON Pretty
* URLEncode
* TypeScript syntax
* CoffeeScript Syntax
* Git
* Jekyll

## Install IntelliJ or Eclipse

- STS plugins
- Lombok plugins

## Install Latest Java

## Scala
 
    $ brew update
    $ brew install scala sbt

## Python

    $ brew install python
    $ brew install python@2
    $ pip install --upgrade setuptools
    $ pip install --upgrade pip
    $ brew install pyenv
    $ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
    $ exec $SHELL
    $ pyenv install 2.7.12
    $ pyenv install 3.5.2

## Node.js

    $ brew install node
    $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
    $ source ~/.bash_profile        # source your bash_profile to add path
    $ command -v nvm          # check the nvm use message
    $ nvm install node        # install most recent Node stable version
    $ nvm use node            # use stable as current version
    $ nvm alias default node  # set the installed stable version as the default Node

## Go

    $ brew install go
    $ export GOPATH=/User/$USER/dev/go_env/
    $ export PATH=$PATH:$(go env GOPATH)/bin

## Docker

## Atom

## Github Desktop

# More Information
* (Github gitingore Files)[https://github.com/github/gitignore]










