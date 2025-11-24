# My Custom Zsh Configuration

Een persoonlijke en mooie Zsh-configuratie met kleuren, emoji’s, history management, syntax highlighting, autosuggestions en fuzzy tab completion met `fzf`.

---

## Inhoud

- Fancy prompt met emoji per directory en root
- Geschiedenisbeheer en autosuggestions
- Syntax highlighting
- Fuzzy tab completion via `fzf`
- Git en `ls` shortcuts
- Arsenal shell integratie

---

## Vereisten

- **Zsh** (`zsh`)
- **fzf** (`sudo apt install fzf`)
- **zsh-syntax-highlighting** (`sudo apt install zsh-syntax-highlighting`)
- **zsh-autosuggestions** (`sudo apt install zsh-autosuggestions`)
- Optioneel: Arsenal shell integration script als je Arsenal gebruikt

---

## Installatie

1. **Clone de repository**

```bash
git clone https://github.com/<jouw-gebruikersnaam>/my-zsh-config.git ~/my-zsh-config
cd ~/my-zsh-config
```
2. **Backup je oude .zshrc**
```bash
mv ~/.zshrc ~/.zshrc.backup
```
3. **Kopieer de nieuwe .zshrc naar je home directory**
```bash
cp .zshrc ~/
```
4. **Activeer de nieuwe configuratie**
```bash
source ~/.zshrc
```
```
ls -a ~ | grep .zshrc
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
```
