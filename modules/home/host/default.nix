{ lib, config, pkgs, host ? null, format ? "unknown", ... }:

let
  inherit (lib) types;
  inherit (lib.afxq) mkOpt;
in {
  options.afxq.host = {
    name = mkOpt (types.nullOr types.str) host "The host name.";
  };
}
