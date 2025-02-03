{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.services;
in {
  options.afxq.services = with types; {
    enable = mkBoolOpt false "Whether or not to enable services.";
  };

  config = mkIf cfg.enable {
    # enable location service
    location.provider = "geoclue2";
    # from afxq
    services = {
      # provide location
      geoclue2.enable = true;

      power-profiles-daemon.enable = true;

      # profile-sync-daemon
      psd = {
        enable = true;
        resyncTimer = "10m";
      };

      # battery info & stuff
      upower.enable = true;

      # needed for GNOME services outside of GNOME Desktop
      dbus.packages = [ pkgs.gcr ];

      udev = {
        packages = with pkgs; [ gnome-settings-daemon ];
        extraRules = ''
          # add my android device to adbusers
          SUBSYSTEM=="usb", ATTR{idVendor}=="22d9", MODE="0666", GROUP="adbusers"
        '';
      };
    };

    systemd.services.ModemManager.enable = true;
    services.postgresql.enable = true;
    services.teamviewer.enable = true;
    services.libinput.enable = true;
    services.xserver = {
      enable = true;
      displayManager.gdm = { enable = true; };
    };
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = "afxq";
      };
      # sddm = { enable = true; };
    };
    services.gvfs.enable = true;
    services.acpid.enable = true;
    services.printing.enable = true;
    services.openssh.enable = true;
    services.geoclue2.appConfig = {
      "com.github.app" = {
        isAllowed = true;
        isSystem = false;
        users = [ "1000" ];
      };
    };
  };
}
