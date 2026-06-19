{
  flake.templates = {
    git-hooks = {
      path = ./hooks;
      description = "git hooks for nix";
    };
    rust = {
      path = ./devShells/rust;
      description = "rust with nix env";
    };
    default = {
      path = ./devShells/default;
      description = "nix env";
    };
  };
}
