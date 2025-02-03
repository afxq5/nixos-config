{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.apps.twitter;
in {
  options.afxq.apps.twitter = with types; {
    enable = mkBoolOpt false "Whether or not to enable Twitter.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.afxq; [ twitter ];
  };
}
