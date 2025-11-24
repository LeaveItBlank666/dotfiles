My Zsh Dotfiles

This repository contains my personal Zsh configuration, including a custom prompt, history settings, fzf fuzzy completion, syntax highlighting, and other handy aliases.

1. Clone this repository

On any machine where you want to use this configuration:

git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles


Replace <your-username> with your GitHub username.

2. Install dependencies

Make sure you have the following installed:

Zsh

fzf

zsh-syntax-highlighting

zsh-autosuggestions

On Debian/Ubuntu/Kali, you can install some with:

sudo apt update
sudo apt install zsh fzf


For syntax highlighting and autosuggestions:

sudo apt install zsh-syntax-highlighting zsh-autosuggestions

3. Activate this configuration

You can either copy the .zshrc file to your home folder:

cp ~/dotfiles/.zshrc ~/
source ~/.zshrc


Or, better, create a symlink so updates automatically apply:

ln -sf ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

4. Optional: keep it up-to-date

If you make changes in the repo, push them:

cd ~/dotfiles
git add .zshrc
git commit -m "Update .zshrc"
git push


On another machine, pull the latest:

cd ~/dotfiles
git pull

5. Notes

The prompt automatically shows 💀 for root and ㉿ for normal user.

Fuzzy tab completion is enabled via fzf.

History, auto-correction, and command autosuggestions are all configured.

Additional tools like Arsenal Shell integration are included if available.
