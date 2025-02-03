{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.cli;
in {
  options.afxq.tools.cli = with types; {
    enable = mkBoolOpt false "Whether or not to enable cli.";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        sqlite
        file
        fd
        starship
        scrot
        acpi
        (ripgrep.override { withPCRE2 = true; })
        shfmt
        shellcheck
        pywal
        macchina
        usbutils
        wget
        terminal-colors
        sysstat
        ntfs3g
        killall
        bat
        eza
        ranger
        socat
        jq
        freshfetch
        htop
        acpi
        inotify-tools
      ];
  };
}
