# nvim-chad

Reference:
https://youtu.be/Mtgo-nP_r8Y
https://youtu.be/i04sSQjd-qo
https://youtu.be/mh_EJhH49Ms

I'll proceed with only cmd lines (This is for linux only, by the way)

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
# alias nvim=vim
# export PATH=$HOME/nvim/bin:$PATH
# save file, if in nano, you have to summon a demon to save it for you
source .bashrc
nvim -v
# if it's not 0.9 or more, then none of the following steps will work
```

## Installing NvimChad

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

```bash
git clone <this_repo> ~/.config/nvim/lua
nvim
# last command might prompt another install window, just wait
```
```vim
:MasonInstall
// wait and see
```

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

## Customising and Mapping

-- TODO: Fill this up!

SPACE t h -> set theme, cat

## Language Support

Inside nvim, press colon (:) and write `:TSInstall <>` being <> the name of the language.
In this case, go or rust, whichever. To see which ones are there, you can call for :TSInstallInfo.
You can write down all the languages you want syntax-highlight on and use them as args, like:
:TSInstall a b c d

