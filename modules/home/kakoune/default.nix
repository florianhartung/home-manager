{ pkgs, lib, config, ... }:
let cfg = config.modules.kakoune;
in {
  options.modules.kakoune = {
    enable = lib.mkEnableOption "kakoune";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.kakoune-lsp ];
    home.shellAliases = {
      "kak-conf" = "kak -n -e 'source ~/.config/home-manager/modules/home/kakoune/kakrc.kak'";
    };

    programs.kak-tree-sitter-helix.enable = true;
    programs.kakoune = {
      enable = true;
      config = null;
      extraConfig = lib.concatStringsSep "\n" [
        ''
        # Install plugins (generated through Nix)
        # Treesitter
        evaluate-commands %sh{ ${lib.getExe pkgs.kak-tree-sitter} --init $kak_session --kakoune --with-text-objects }
        tree-sitter-session-begin

        # LSP
        eval %sh{${lib.getExe pkgs.kakoune-lsp}}
        lsp-enable
        ''
        "# Main kakrc"
        (builtins.readFile ./kakrc.kak)
    ];
    };
  };
}
