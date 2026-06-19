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
      packages = [pkgs.nixd] ++ config.pre-commit.settings.enabledPackages;
    };
  };
}
