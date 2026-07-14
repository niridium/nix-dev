{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      shellHook = ''
        ${config.pre-commit.settings.shellHook}
      '';
      packages = with pkgs;
        [
          nixd
          # Shell
          (bats.withLibraries (p: [p.bats-assert p.bats-file p.bats-support]))
          shellcheck
          shfmt
          bash-language-server
        ]
        ++ config.pre-commit.settings.enabledPackages;
    };
  };
}
