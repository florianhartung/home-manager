{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.gitlab;
in
{
  options.modules.gitlab = {
    enable = lib.mkEnableOption "local gitlab instance";
  };

  config = lib.mkIf cfg.enable {
    services.gitlab = {
      enable = true;
      databasePasswordFile = pkgs.writeText "dbPassword" "zgvcyfwsxzcwr85l";
      initialRootPasswordFile = pkgs.writeText "rootPassword" "dakqdvp4ovhksxer";
      secrets = {
        secretFile = pkgs.writeText "secret" "Aig5zaic";
        otpFile = pkgs.writeText "otpsecret" "Riew9mue";
        dbFile = pkgs.writeText "dbsecret" "we2quaeZ";
        jwsFile = pkgs.runCommand "oidcKeyBase" { } "${pkgs.openssl}/bin/openssl genrsa 2048 > $out";

        activeRecordPrimaryKeyFile = pkgs.writeText "primaryKeyFile" "lksadfiowerksdfajkl";
        activeRecordDeterministicKeyFile = pkgs.writeText "deterministicKeyFile" "lkasdfljkasdfuiywer";
        activeRecordSaltFile = pkgs.writeText "saltFile" "jklsadfkwerwer";
      };
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts = {
        localhost = {
          locations."/".proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
        };
      };
    };

    services.postgresql.package = pkgs-unstable.postgresql_17;

    services.openssh.enable = true;

    systemd.services.gitlab-backup.environment.BACKUP = "dump";
  };
}
