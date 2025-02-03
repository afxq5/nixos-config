{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.python;
in {
  options.afxq.develop.python = with types; {
    enable = mkBoolOpt false "Whether or not to enable python.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python312
      python312Packages.setuptools
      python312Packages.poetry-core
      python312Packages.pip
      python312Packages.black
      python312Packages.pyflakes
      python312Packages.pytest
      poetry
    ];
  };
}
