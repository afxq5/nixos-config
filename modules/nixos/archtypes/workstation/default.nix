{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.archetypes.workstation;
in {
  options.afxq.archetypes.workstation = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the workstation archetype.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        colorls
        # propagatedIcon
      ];
    afxq = {
      shell.zsh = enabled;
      suites = {
        common = enabled;
        common-slim = enabled;
        desktop = enabled;
         development = enabled;
         emulation = enabled;
         art = enabled;
         video = enabled;
         social = enabled;
         media = enabled;
         music = enabled;
         office = enabled;
      };
      services = enabled;

      # tools = { appimage-run = enabled; };

      home = {
        file = {
          "Desktop/.keep".text = "";
          "Documents/.keep".text = "";
          "Downloads/.keep".text = "";
          "Music/.keep".text = "";
          "Pictures/.keep".text = "";
          #"Videos/.keep".text = "";
          "work/.keep".text = "";
          # ".face".source = cfg.icon;
          #   "Pictures/${
          #   afxq.user.icon.fileName or (builtins.baseNameOf afxq.user.icon)
          # }".source = afxq.user.icon;
        };
        extraOptions = {
          targets.genericLinux.enable = true;
          home = {
            sessionVariables = {
              QT_XCB_GL_INTEGRATION = "none"; # kde-connect
              EDITOR = "nvim";
              VISUAL = "neovide";
              # BROWSER = "flatpak run org.mozilla.firefox";
              TERMINAL = "wezterm";
              XCURSOR_THEME = "Qogir";
              NIXPKGS_ALLOW_UNFREE = "1";
            };
            sessionPath = [
              "$HOME/.local/bin"
              "$HOME/.cargo/bin/"
              "$HOME/.npm-packages/bin/"
            ];
          };
          xdg.desktopEntries = {
            "org.wezfurlong.wezterm" = {
              name = "WezTerm";
              comment = "Wez's Terminal Emulator";
              icon = "org.wezfurlong.wezterm";
              exec = "nixGL ${pkgs.wezterm}/bin/wezterm start --cwd .";
              categories = [ "System" "TerminalEmulator" "Utility" ];
              terminal = false;
            };
            "neovide" = {
              categories = [ "Utility" "TextEditor" "Development" "IDE" ];
              comment = "Code Editing. Redefined.";
              exec = "/usr/bin/env -u WAYLAND_DISPLAY neovide %F";
              genericName = "Text Editor";
              icon = "neovide";
              mimeType = [ "text/plain" "inode/directory" ];
              name = "NeoVide";
              startupNotify = true;
              type = "Application";
            };
          };
          # programs.home-manager = enabled;
          programs.git = {
            enable = true;
            userName = "Abdallah Ali";
            userEmail = "amaali1991@gmail.com";
            aliases = { st = "status"; };
            extraConfig = {
              init = { defaultBranch = "main"; };
              safe = { directory = "*"; };
            };
          };
          home.shellAliases = {
            lc = "${pkgs.colorls}/bin/colorls --sd";
            lcg = "lc --gs";
            lcl = "lc -1";
            lclg = "lc -1 --gs";
            lcu = "${pkgs.colorls}/bin/colorls -U";
            lclu = "${pkgs.colorls}/bin/colorls -U -1";
            vim = "nvim";
            vi = "nvim";
          };
          # User config
          programs = {
            starship = {
              enable = true;
              settings = {
                character = {
                  success_symbol = "[➜](bold green)";
                  error_symbol = "[✗](bold red) ";
                  vicmd_symbol = "[](bold blue) ";
                };
              };
            };
          };
        };
      };
    };
  };
}
