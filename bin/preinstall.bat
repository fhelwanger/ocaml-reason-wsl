@echo off

echo Installing ocaml...
set bashcmd="sudo apt-get update; sudo apt-get install -y m4 ocaml-nox ocaml ocaml-native-compilers opam gcc-multilib gcc-mingw-w64-i686 gcc-mingw-w64-x86-64"
call "%~dp0base.bat"

echo Configuring opam...
set bashcmd="opam init --auto-setup --dot-profile=~/.bashrc; opam switch 4.04.0; eval `opam config env`"
call "%~dp0base.bat"

echo Installing opam packages...
set bashcmd="opam repository add windows git://github.com/whitequark/opam-cross-windows"
call "%~dp0base.bat"
set bashcmd="opam install -y reason; opam install -y merlin; opam install -y ocp-indent; opam install -y ocaml-windows"
call "%~dp0base.bat"
