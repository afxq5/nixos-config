{ pkgs, lib, inputs, ... }:

with lib;
with lib.afxq; {
  imports = [ ./hardware.nix ];
  boot.kernelModules = [ "kvm-intel" ];
  nixpkgs.buildPlatform.system = "x86_64-linux";
  nixpkgs.hostPlatform.system = "aarch64-linux";
  afxq = {
    archetypes = {
      workstation = enabled;
      gaming = enabled;
    };
  };
  system.stateVersion = "24.11";
}
