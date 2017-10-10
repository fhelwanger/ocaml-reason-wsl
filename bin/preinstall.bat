@echo off

REM Update package list
set "bashcmd=sudo apt-get update"

REM Install nodejs
set "bashcmd=%bashcmd%; curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -"
set "bashcmd=%bashcmd%; sudo apt-get install -y nodejs"

REM Fix npm permission issues
set "bashcmd=%bashcmd%; mkdir -p ~/.npm-global"
set "bashcmd=%bashcmd%; npm config set prefix '~/.npm-global'"
set "bashcmd=%bashcmd%; grep -Fq 'export PATH=~/.npm-global/bin:$PATH' ~/.bashrc || echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc"
set "bashcmd=%bashcmd%; source ~/.bashrc"

REM Install bucklescript
set "bashcmd=%bashcmd%; npm install -g bs-platform"

REM Install ocaml
set "bashcmd=%bashcmd%; sudo apt-get install -y m4 ocaml-nox ocaml opam"

REM Configure opam
set "bashcmd=%bashcmd%; opam init --auto-setup --dot-profile=~/.bashrc"
set "bashcmd=%bashcmd%; opam update"
set "bashcmd=%bashcmd%; opam switch 4.02.3"
set "bashcmd=%bashcmd%; opam install -y reason.1.13.7"
set "bashcmd=%bashcmd%; opam install -y merlin.2.5.4"

call "%~dp0base.bat"
