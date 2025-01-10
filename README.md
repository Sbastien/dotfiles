# 📁 Dotfiles Setup Guide

This repository contains my personal dotfiles to quickly set up a development environment on macOS. It uses **[Chezmoi](https://www.chezmoi.io/)** for efficient dotfiles management and customization.

---

## ⚙️ Prerequisites

Before proceeding, make sure your machine is set up with the **[macos-dev-setup](https://github.com/Sbastien/macos-dev-setup)** repository.  
This will install **Homebrew**, **Chezmoi**, and other essential tools.

---

## 🛠 Step 1: Create your Local Git Configuration

Before initializing your dotfiles, set up your local Git configuration to ensure your commits use the correct name and email.

Run the following command to create a ~/.gitconfig.local file:

```bash
cat <<EOF > ~/.gitconfig.local
[user]
    name = John Doe
    email = john.doe@example.com
EOF
```

## 🍺 Step 2: Initialize Homebrew

Ensure Homebrew is properly initialized by running:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 🚀 Step 3: Apply the Dotfiles with Chezmoi

To set up your dotfiles, use the following Chezmoi command:

```bash
chezmoi init --apply Sbastien
```

## 🎉 Step 4: Restart your terminal

Happy coding! 🖥️
