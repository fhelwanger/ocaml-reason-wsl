@echo off

echo "Installing ocaml..."
set bashcmd="sudo apt-get -y install m4 ocaml-nox ocaml ocaml-native-compilers opam"
call %~dp0base.bat

echo "Configuring opam..."
set bashcmd="opam init; opam switch 4.02.3; opam config env"
call %~dp0base.bat

echo "Installing reason..."
set bashcmd="opam install -y reason; opam install -y merlin; opam install -y ocp-indent"
call %~dp0base.bat
