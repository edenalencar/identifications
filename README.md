<div align="center">

<img src="https://user-images.githubusercontent.com/7075481/117592396-b9cfe480-b10e-11eb-9e74-f039b1b5a100.png" alt="Identifications Logo" width="128"/>

# Identifications

**A developer tool to generate valid Brazilian identification numbers (CPF, CNPJ, IE) for testing and QA.**

[![CI](https://github.com/edenalencar/identifications/workflows/CI/badge.svg)](https://github.com/edenalencar/identifications/actions)
[![Flathub](https://flathub.org/api/badge/com.github.edenalencar.identifications.svg)](https://flathub.org/apps/details/com.github.edenalencar.identifications)

</div>

---

## 📸 Screenshots

<div align="center">
  <img src="data/screenshots/CPF.png" alt="CPF Generator" width="250"/>
  <img src="data/screenshots/CNPJ_Branches.png" alt="CNPJ Generator" width="250"/>
  <img src="data/screenshots/IE.png" alt="IE Generator" width="250"/>
</div>

## ✨ Features

- **CPF Generation**: Generate valid CPF numbers with or without formatting.
- **CNPJ Generation**: Create CNPJ numbers, including support for branches, with optional formatting.
- **State Registration (IE)**: Generate valid State Registration numbers for all Brazilian states.
- **Clipboard Integration**: Easily copy generated identifications to the clipboard.
- **Dark Mode**: Fully supports system dark theme.

## 🚀 Installation

### Flathub
The easiest way to install **Identifications** is via Flathub.

<a href='https://flathub.org/apps/details/com.github.edenalencar.identifications'>
  <img width='200' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-en.png'/>
</a>

## 🛠️ Building from Source

### Dependencies
To build the project, you need the following dependencies:
- `meson`
- `ninja`
- `valac`
- `pkg-config`
- `libgtk-3-dev`
- `libgee-0.8-dev`
- `libjson-glib-dev`
- `libsoup2.4-dev`

### Option 1: GNOME Builder
1. Open **GNOME Builder**.
2. Select **Clone Repository**.
3. Enter `git@github.com:edenalencar/identifications.git`.
4. Click **Clone Project**.
5. Click the **Run** button to build and run.

### Option 2: Meson (CLI)

1. Clone the repository:
   ```bash
   git clone https://github.com/edenalencar/identifications.git
   cd identifications
   ```

2. Configure and build:
   ```bash
   meson build --prefix=/usr
   cd build
   meson compile
   ```

3. Run:
   ```bash
   ./src/com.github.edenalencar.identifications
   ```

## 🤝 Donations

If this project helps you, consider making a donation to support development!

| Platform | Donate |
| :---: | :---: |
| **Liberapay** | [<img src="https://liberapay.com/assets/widgets/donate.svg" height="30">](https://liberapay.com/edenalencar/donate) |
| **PayPal** | [<img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" height="30">](https://www.paypal.com/donate?hosted_button_id=BNC28Y2U9W77L) |

## 📄 License
This project is licensed under the GPL-3.0 License - see the [COPYING](COPYING) file for details.

 
