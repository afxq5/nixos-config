{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.hardware.storage;
in {
  options.afxq.hardware.storage = with types; {
    enable = mkBoolOpt false
      "Whether or not to enable support for extra storage devices.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ ntfs3g fuseiso ];
  };
}
