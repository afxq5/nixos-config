{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.office;
in {
  options.afxq.suites.office = with types; {
    enable = mkBoolOpt false "Whether or not to enable office configuration.";
  };

  config = mkIf cfg.enable {
    # environment.systemPackages = [ pkgs.afxq.list-iommu ];

    afxq = { apps = { libreoffice = enabled; }; };
  };
}
