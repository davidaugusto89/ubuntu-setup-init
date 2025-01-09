# Ubuntu Setup Init 🚀

![GitHub repo size](https://img.shields.io/github/repo-size/seu-usuario/ubuntu-setup-init?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/seu-usuario/ubuntu-setup-init?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/seu-usuario/ubuntu-setup-init?style=for-the-badge)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04%2B-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Script-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

---

## 📋 **Sobre o Projeto**

**`ubuntu-setup-init`** é um script pós-instalação para Ubuntu que automatiza a configuração inicial do sistema, incluindo:

- Atualização de pacotes.
- Instalação de ferramentas essenciais (Git, Docker, VSCode, Node.js, etc.).
- Configuração do tema e plano de fundo.
- Configuração do Git e SSH.
- Atalhos personalizados, incluindo Flameshot.

O script foi criado para facilitar a configuração do ambiente de desenvolvimento após uma nova instalação do Ubuntu.

---

## 📦 **O que o Script Faz**

- ✅ Atualiza pacotes do sistema.
- ✅ Instala pacotes essenciais como Git, Docker, VSCode, Node.js, etc.
- ✅ Configura o tema do sistema para **Yaru-blue-dark**.
- ✅ Define o plano de fundo para **Northern Lights**.
- ✅ Configura atalhos de teclado personalizados para o Flameshot.
- ✅ Configura o Git com o e-mail do usuário.

---

## 📋 **O que o Script Instala**

| Ferramenta      | Comando de Instalação                                                          |
|-----------------|-------------------------------------------------------------------------------|
| Git             | `sudo apt install -y git`                                                     |
| Docker          | `sudo apt install -y docker.io`                                               |
| VSCode          | `sudo apt install -y code`                                                    |
| Node.js         | `curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -`           |
| Flameshot       | `sudo apt install -y flameshot`                                               |
| Oh My Zsh       | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

---

## 🖼️ **Configurações de Tema e Plano de Fundo**

O script aplica as seguintes configurações no sistema:

- **Tema:** `Yaru-blue-dark`
- **Ícones:** `Yaru-blue`
- **Plano de Fundo:** `Northan_lights_by_mizuno.webp`

---

## 🔧 **Atalhos Personalizados Criados**

| Tecla        | Função           |
|--------------|------------------|
| `Print`      | Abre o Flameshot |

---

## 📋 **Notas**

- Certifique-se de que o arquivo **`setup.sh`** tem permissão de execução:

```bash
chmod +x setup.sh
```

---

## 🧑‍💻 **Autor**

Feito com ❤️ por David Augusto