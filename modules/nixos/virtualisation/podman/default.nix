{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.virtualisation.podman;
in {
  options.afxq.virtualisation.podman = with types; {
    enable = mkBoolOpt false "Whether or not to enable Podman.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ podman-compose ];

    afxq.home.extraOptions = {
      home.shellAliases = { "docker-compose" = "podman-compose"; };
    };

    # NixOS 22.05 moved NixOS Containers to a new state directory and the old
    # directory is taken over by OCI Containers (eg. podman). For systems with
    # system.stateVersion < 22.05, it is not possible to have both enabled.
    # This option disables NixOS Containers, leaving OCI Containers available.
    boot.enableContainers = false;

    virtualisation = {
      podman = {
        enable = cfg.enable;
        # dockerCompat = true;
      };
    };
  };
}
