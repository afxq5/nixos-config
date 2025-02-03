{ options, config, lib, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.security;
in {
  options.afxq.security = with types; {
    enable = mkBoolOpt false "Whether or not to enable zathura.";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    security.soteria.enable = true;
    security = {
      # allow wayland lockers to unlock the screen
      pam.services.swaylock.text = "auth include login";

    };
  };
}
