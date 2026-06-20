{inputs, ...}: {
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];
  perSystem = {pkgs, ...}: {
    pre-commit.settings = {
      package = pkgs.prek;
      hooks = {
        #---Nix-----------------
        alejandra = {
          enable = true;
          excludes = ["flake.nix"];
        };
        deadnix.enable = true;
        statix.enable = true;
        #--------------------
      };
    };
  };
}
