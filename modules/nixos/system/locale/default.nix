{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.system.locale;
in {
  options.afxq.system.locale = with types; {
    enable = mkBoolOpt false "Whether or not to manage locale settings.";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";

    console = { keyMap = mkForce "us"; };
  };
}
