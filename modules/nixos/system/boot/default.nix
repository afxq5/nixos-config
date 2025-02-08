{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.system.boot;
in {
  options.afxq.system.boot = with types; {
    enable = mkBoolOpt false "Whether or not to enable booting.";
  };

  config = mkIf cfg.enable {
    # Bootloader.
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";

    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';
    };
    boot.plymouth = { enable = true; };
    # for build raspberry pi image 
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
