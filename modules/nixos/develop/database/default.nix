{ config, lib, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.database;
in {
  options.afxq.develop.database = with types; {
    enable = mkBoolOpt false "Whether or not to enable c_cpp.";
  };

  config = mkIf cfg.enable {
    afxq = {
      # apps = { mariadb = enabled; };
    };
  };
}
