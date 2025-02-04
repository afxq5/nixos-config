{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.zen;
in {
  options.afxq.apps.zen = with types; {
    enable = mkBoolOpt false "Whether or not to enable zen.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages."${pkgs.system}".default
    ];
  };
}
