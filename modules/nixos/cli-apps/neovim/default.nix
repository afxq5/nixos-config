{ inputs, lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.neovim;
in {
  options.afxq.cli-apps.neovim = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # inputs.nixvim.packages.${pkgs.system}.default
      # lunarvim
			# afxq.neovim
      neovim
      nil
      stylua
      lua-language-server
      deno
      nixpkgs-fmt
    ];
  };
}
