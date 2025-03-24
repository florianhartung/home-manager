{ pkgs, ... }: {
  home.packages = [
    pkgs.rustic
    (
      let
        rustic = "${pkgs.rustic}/bin/rustic";
      in
      pkgs.writeShellScriptBin "backup-all" ''
        ${rustic} backup --glob "!**target" --as-path docs --label docs ~/docs
        ${rustic} backup --glob "!**target" --as-path git --label git ~/git
        ${rustic} backup --as-path downloads --label downloads ~/downloads
        ${rustic} backup --as-path backups --label backups ~/backups
      ''
    )
  ];
}
