{
  flake.templates = {
    git-hooks = {
      path = ./hooks;
      description = "git hooks for nix";
    };
    rust = {
      path = ./devShells/rust;
      description = "rust/nix env";
    };
  };
}
