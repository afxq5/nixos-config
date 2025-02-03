{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.lisp;
in {
  options.afxq.develop.lisp = with types; {
    enable = mkBoolOpt false "Whether or not to enable lisp.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ gcl sbcl ]; };
}
