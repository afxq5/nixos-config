{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let
  cfg = config.afxq.suites.games;
  apps = {
    # openra = enabled;
    aisleriot = enabled;
    xonotic = enabled;
    # retroarch = enabled;
  };
in {
  options.afxq.suites.games = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common games configuration.";
  };

  config = mkIf cfg.enable { afxq = { inherit apps; }; };
}
