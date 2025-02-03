{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.javascript;
in {
  options.afxq.develop.javascript = with types; {
    enable = mkBoolOpt false "Whether or not to enable javascript.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nodePackages.node-gyp nodejs_20 ];
  };
}
