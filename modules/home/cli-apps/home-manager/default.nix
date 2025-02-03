{ lib, config, inputs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.afxq) enabled;

  cfg = config.afxq.cli-apps.home-manager;
in {
  options.afxq.cli-apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager = enabled;

    programs.nix-index = {
      enable = true;
      enableZshIntegration = true;
    };

  };
}
