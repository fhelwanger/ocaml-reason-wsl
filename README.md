# ocaml-on-windows

Execute [ocaml](http://ocaml.org/) and [reason](https://reasonml.github.io/) binaries on windows through WSL (Windows Subsystem for Linux).

## What?

At least in my very limited experience, ocaml has a very poor support for windows. Now that we have WSL, we can install it here, but it won't interop well with editors and other apps that won't "see" the binaries installed there.

The ideia of this project is to create some simple batch files that call `bash -c <ocaml-binary> <parameters>` that editors and other programs can call to access the ocaml binaries installed on WSL.

## Install

The only pre-requisite is that you have [Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) already configured. After that, just run and follow the instructions.

```
npm install -g ocaml-on-windows
```

> Pay attention when the opam installer asks which file to put the initialization scripts. You may want to change it to `~/.bashrc`.

## Editor Integration

### vscode

The [reason extension for vscode](https://marketplace.visualstudio.com/items?itemName=freebroccolo.reasonml) won't find these .bat files by default. You must put the following in your vscode settings:

```json
{
  "reason.path.ocamlfind": "ocamlfind.bat",
  "reason.path.ocamlmerlin": "ocamlmerlin.bat",
  "reason.path.opam": "opam.bat",
  "reason.path.rebuild": "rebuild.bat",
  "reason.path.refmt": "refmt.bat",
  "reason.path.refmterr": "refmterr.bat",
  "reason.path.rtop": "rtop.bat"
}
```
