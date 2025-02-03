{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.obs-studio;
in {
  options.afxq.apps.obs-studio = with types; {
    enable = mkBoolOpt false "Whether or not to enable obs_studio.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        obs-studio
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-gstreamer
      ];
  };
}
