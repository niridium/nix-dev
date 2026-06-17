{
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    devShells.rust = let
      overrides = lib.fromTOML (builtins.readFile ./rust-toolchain.toml);
    in
      pkgs.mkShell {
        strictDeps = true;
        nativeBuildInputs = with pkgs; [
          rustup
          rustPlatform.bindgenHook
        ];
        buildInputs = [];
        RUSTC_VERSION = overrides.toolchain.channel;
        shellHook = ''
          export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH";
          export PATH="''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-${pkgs.stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
        '';
      };
  };
}
