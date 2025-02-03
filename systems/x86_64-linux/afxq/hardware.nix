{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.plymouth.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9777f002-d3b2-42b9-ab41-4f5b4b3294ff";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/0362-0A8E";
      fsType = "vfat";
    };
  swapDevices = [ ];
  # virtualisation.docker.enable = true;
  # virtualisation.libvirtd.enable = true;
  #  hardware.pulseaudio.enable = true;
  #  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  hardware.acpilight.enable = true;
  hardware = {
    graphics.enable32Bit = true;
    pulseaudio.support32Bit = true;
  };
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
