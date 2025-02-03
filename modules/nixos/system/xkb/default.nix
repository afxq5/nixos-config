{ options, config, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.system.xkb;
in {
  options.afxq.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      xkb = {
        layout = "us,ara";
       options = "caps:escape";
      };
    };
  };
}
