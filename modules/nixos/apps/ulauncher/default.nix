{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.ulauncher;
in {
  options.afxq.apps.ulauncher = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python312Packages.todoist-api-python
      ulauncher
    ];
  };
}
