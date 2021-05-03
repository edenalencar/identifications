
![br com dialogandoti identificacoes](https://user-images.githubusercontent.com/7075481/116942489-12533d80-ac48-11eb-9cc0-5d4e282e8077.png)


# Identifications
It is a tool for the QA team and developers who needed identifications used in Brazil as CPF, CNPJ and IE to test.

# Screenshots
![CPF](https://user-images.githubusercontent.com/7075481/116934335-3c523300-ac3b-11eb-84be-4612b966785b.png)
![CNPJ com filias](https://user-images.githubusercontent.com/7075481/116934405-55f37a80-ac3b-11eb-8fa2-09387d4b0be8.png)
![IE](https://user-images.githubusercontent.com/7075481/116934413-5855d480-ac3b-11eb-90af-f48728bddbb3.png)


# Features
* Generate CPF with or without format
* Generate CPNJ with branchs and with or without format
* Generate IE with or without formar
* Copy all idenfications generated to clipboard

# Instalation
_Get from Flathub_

# Building from source
---
  Option 1: with GNOME Builder
  * Open GNOME Builder
  * Click the Clone Repository button
  * Enter git@github.com:edenalencar/identifications.git in the field Repository URL
  * Click the Clone Project button
  * Click the Run button to start building application

# Building from source
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
  
 
