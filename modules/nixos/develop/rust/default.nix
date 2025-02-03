{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.develop.rust;
in {
  options.afxq.develop.rust = with types; {
    enable = mkBoolOpt false "Whether or not to enable rust.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rust-script
      rustup
      diesel-cli
      sqlite
      sqlite.dev
      cargo-generate
    ];
  };
}
