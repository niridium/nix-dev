{inputs, ...}: {
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    devShells.rust = let
      overrides = lib.fromTOML (builtins.readFile ./rust-toolchain.toml);
    in
      pkgs.mkShell {
        name = "rustup";
        strictDeps = true;
        packages =
          [pkgs.nixd]
          ++
          #---Packages from git hooks--------------------
          config.pre-commit.settings.enabledPackages;
        #-----------------------------
        nativeBuildInputs = with pkgs; [
          rustup
          rustPlatform.bindgenHook
        ];
        buildInputs = [];
        RUSTC_VERSION = overrides.toolchain.channel;
        shellHook = ''
          #---Setup git hooks--------------------
          ${config.pre-commit.settings.shellHook}
          #--------------------------------------
          export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH";
          export PATH="''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-${pkgs.stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
        '';
      };
  };
}
