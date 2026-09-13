{
  pkgs,
  ...
}:
{
  home.username = "hart_fo";
  home.homeDirectory = "/home/hart_fo";
  home.stateVersion = "23.11"; # shouldn't be changed ever

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../modules/home
  ];

  modules = {
    base.enable = true;

    alacritty.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    gde-stuff = {
      enable = true;
      mouse-speed = 0.58;
    };
    vscodium.enable = true;
    zed.enable = true;
  };

  programs.git.settings.user.email = "florian.hartung@dlr.de";

  home.packages = with pkgs; [
    yubioath-flutter
    nixd

    unzip
    btop
    mattermost-desktop
    # citrix_workspace # TODO broken
    openssl
    thunderbird

    mutter
    dconf-editor
    wl-clipboard
    ltex-ls
    element-desktop

    (pkgs.writeShellScriptBin "todo" ''
      ${pkgs.helix}/bin/hx ~/docs/todo.md
    '')
  ];

  home.shellAliases = {
    cdg = "cd ~/git";
    cdm = "cd ~/git/florianhartung";
    hswitch = "home-manager switch";
  };

  home.sessionVariables = {
    # EDITOR = "${pkgs.helix}/bin/hx";

    # For VSCodium
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
