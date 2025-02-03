{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.afxq;
let
  cfg = config.afxq.nix;

  substituters-submodule = types.submodule ({ name, ... }: {
    options = with types; {
      key =
        mkOpt (nullOr str) null "The trusted public key for this substituter.";
    };
  });
in
{
  options.afxq.nix = with types; {
    enable = mkBoolOpt true "Whether or not to manage nix configuration.";
    package = mkOpt package pkgs.lix "Which nix package to use.";

    default-substituter = {
      url = mkOpt str "https://cache.nixos.org" "The url for the substituter.";
      key = mkOpt str
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "The trusted public key for the substituter.";
    };

    extra-substituters = mkOpt (attrsOf substituters-submodule) { }
      "Extra substituters to configure.";
  };

  config = mkIf cfg.enable {
    assertions = mapAttrsToList
      (name: value: {
        assertion = value.key != null;
        message = "afxq.nix.extra-substituters.${name}.key must be set";
      })
      cfg.extra-substituters;

    environment.systemPackages = with pkgs; [
      # afxq.nixos-revision
      # (afxq.nixos-hosts.override {
      #   hosts = inputs.self.nixosConfigurations;
      # })
      nixfmt-classic
      nix-index
      nix-prefetch-git
      nix-output-monitor
      nixpkgs-fmt
      nixd
      nil
      # rnix-lsp
      stdenv
    ];

    nix =
      let
        users = [ "root" config.afxq.user.name ]
          ++ optional config.services.hydra.enable "hydra";
      in
      {
        package = cfg.package;

        settings = {
          experimental-features = "nix-command flakes";
          http-connections = 50;
          warn-dirty = false;
          log-lines = 50;
          sandbox = "relaxed";
          auto-optimise-store = true;
          trusted-users = users;
          allowed-users = users;

          substituters = [ cfg.default-substituter.url ]
            ++ (mapAttrsToList (name: value: name) cfg.extra-substituters);
          trusted-public-keys = [ cfg.default-substituter.key ]
            ++ (mapAttrsToList (name: value: value.key) cfg.extra-substituters);

        } // (lib.optionalAttrs config.afxq.tools.direnv.enable {
          keep-outputs = true;
          keep-derivations = true;
        });

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 30d";
        };

        # flake-utils-plus
        generateRegistryFromInputs = true;
        generateNixPathFromInputs = true;
        linkInputs = true;
      };
  };
}
