let
  pkgs_main = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz") {};
in
pkgs_main.mkShell {
  packages = [
    pkgs_main.racket-minimal
  ];
}
