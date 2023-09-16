# nvim-chad

Reference:
> https://youtu.be/Mtgo-nP_r8Y
> https://youtu.be/i04sSQjd-qo
> https://youtu.be/mh_EJhH49Ms

I'll proceed with only cmd lines (This is for linux only, by the way)
Just my two cents here. If you have to use Windows, then either go for Linux Virtual
Machine (this runs fine on Windows) or go for a WSL config. I use both.

## Installing Nvim 0.9

Disclaimer: This set of instructions work as long as you don't have another vim installed
and have both rust and go installed already. As for go, make sure you GOPATH is corret.

```bash
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo apt-get install xz-utils
tar -xf nvim-linux64.tar.gz
mv nvim-linux64 nvim
cp -r nvim $HOME
cd
sublime .bashrc (could use nano, but it sucks)
# append to file the following lines without '#':
# alias vim=nvim
# export PATH=$HOME/nvim/bin:$PATH
# save file, if in nano, you have to summon a demon to save it for you
source .bashrc
nvim -v
# if it's not 0.9 or more, then none of the following steps will work
```

## Installing NvChad

Disclaimer: Make sure you have gcc or g++ or ming64w installed. You need either C or C++
for nvim-treesitter to work. Might be a pain, but make sure it works. Always use the tag
--reinstall when installing these, maybe you do have them, but they're corrupted or some
shit (that was my case).

```bash
sudo apt-get install --reinstall -y build-essential
sudo apt-get install --reinstall -y git
gcc --version
# if last line outputs something other than dread, hooray!

# if you have a nvim setup with some shit you don't want to lose, back that up with
# mv ~/.config/nvim ~/.config/nvim.backup

rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
# Press N when nvim asks you to use setupt on its own and wait for nvim to set default
```

## Cloning repo into config folder

Considerations:

- As for GO, again, make sure your GOPATH is set accordingly, and now install the the
following go packages: gofumpt, goimports-reviser and golines. For these to work, you
have to install them using `go instal ...` and be able to call them, e.g. `golines`,
if this last command prompts `golines is not a command`, then your GOPATH is messed up.

```bash
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

- As for Rust, again, make sure you installed Rust. You will need it for the next command.

```bash
rustup component add rust-analyzer
sudo apt-get update
sudo apt-get install lldb
```

- As for Ruby, again, install RVM, and the gems.

```bash
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-get install curl wget -y
\curl -sSL https://get.rvm.io | sudo bash
# exit all terminals and then open another one
rvm list
# No RVM rubies? Then proceed.
rvm install 3.2.0 # for example
```

```bash
gem install solargraph
gem install neovim
gem install bundler
```

As for all:

```bash
sudo apt-get -qq update
sudo apt-get -qq install sqlite3 libsqlite3-dev xclip python3-pip -y
sudo npm install -s -g neovim diagnostic-languageserver -y
```

```bash
mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom.backup 
git clone git@github.com:RickHPotter/nvim-chad.git ~/.config/nvim/lua/custom
nvim
# last command might prompt another install window, just wait
```

```bash
Then inside nvim, a prompt will popup for new install, wait. A second time,
you might have to run the following command.
```vim
:MasonInstallAll
// wait and see, dont get confused, theres an 'All' at the end.
```

## Customising and Mapping

SPACE t h -> set theme, cat

-- TODO: Fill this up!

