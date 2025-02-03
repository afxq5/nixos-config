{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.media;
in {
  options.afxq.suites.media = with types; {
    enable = mkBoolOpt false "Whether or not to enable media configuration.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        mousai = enabled;
        ani-cli = enabled;
        freetube = enabled;
        webtorrent = enabled;
        #tartube = enabled;
      };
    };
  };
}
