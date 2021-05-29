[![Actions Status](https://github.com/edenalencar/identifications/workflows/CI/badge.svg)](https://github.com/edenalencar/identifications/actions)


![icone](https://user-images.githubusercontent.com/7075481/117592396-b9cfe480-b10e-11eb-9e74-f039b1b5a100.png)


# Identifications
It is a tool for the QA team and developers who needed identifications used in Brazil as CPF, CNPJ and IE to test.

# Screenshots
![CPF](data/screenshots/CPF.png)
![CNPJ com filias](data/screenshots/CNPJ_Branches.png)
![IE](data/screenshots/IE.png)


# Features
* Generate CPF with or without format
* Generate CPNJ with branchs and with or without format
* Generate IE with or without format
* Copy all idenfications generated to clipboard

# Instalation
<a href='https://flathub.org/apps/details/com.github.edenalencar.identifications'><img width='240' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-en.png'/></a>


# Building from source

  Option 1: with GNOME Builder
  * Open GNOME Builder
  * Click the Clone Repository button
  * Enter git@github.com:edenalencar/identifications.git in the field Repository URL
  * Click the Clone Project button
  * Click the Run button to start building application
  
  Option 2: with Meson
  You'll need the following dependencies:
  * gio-2.0
  * gtk+-3.0
  * gee-0.8
  * gettext
  * glib2
  * gtk3
  * meson
  * vala
  * ninja
  * git
  
  Clone the repository and change to the project directory
  
    git clone git@github.com:edenalencar/identifications.git
    cd identifications
    
  Run meson build to configure the build environment. Change to the build directory and run ninja to build
    
    meson build --prefix=/usr
    cd build
    meson compile

 # Donations
  If you would like to help me in this and future projects, please choose one of the options below to donate!
 
#### Option 1: Liberapay
   <noscript><a href="https://liberapay.com/edenalencar/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a></noscript>

#### Option 2: Paypal
  [![](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate?hosted_button_id=BNC28Y2U9W77L)

 
