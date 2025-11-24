# My Custom Zsh Configuration

Een persoonlijke, fancy en efficiënte `.zshrc` configuratie voor Zsh met:  

- Emoji-based prompt met 🏠 voor home en 💀 voor root  
- Fuzzy tab completion via **fzf**  
- Command auto-suggestions  
- Syntax highlighting  
- Git en ls aliases  
- Arsenal shell integration  

---

## 📦 Dependencies

Voor een volledige ervaring heb je nodig:

- [Zsh](https://www.zsh.org/) (minimaal 5.0)  
- [fzf](https://github.com/junegunn/fzf) voor fuzzy completion  
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)  
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)  

Installeer bijvoorbeeld op Debian/Ubuntu/Kali:

```bash
sudo apt update
sudo apt install zsh fzf
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/share/zsh-autosuggestions
