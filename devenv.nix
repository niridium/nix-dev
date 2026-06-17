{pkgs, ...}: {
  packages = [pkgs.git pkgs.alejandra];
  languages.nix.enable = true;
  enterShell = ''
    nix develop github:niridium/nix-shells/#rust
  '';
}
