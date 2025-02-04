{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.environment;
in {
  options.afxq.environment = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config = mkIf cfg.enable {
    environment = {
      sessionVariables = {
        LD_LIBRARY_PATH = lib.mkDefault "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.openssl}/lib";
      };
    };
  };
}
