{ pkgs, ... }:
{
  home.username = "hart_fo";
  home.homeDirectory = "/home/hart_fo";
  home.stateVersion = "23.11"; # shouldn't be changed ever
  
  nixpkgs.config.allowUnfree = true;

  imports = [
    # Common home config
    ./common.nix
    ../programs/common

    # Desktop and basic programs
    ../desktop

    # Additional programs
    ../programs/vscodium
  ];

  desktop = {
    mouse-speed = 0.58;
  };

  home.packages = with pkgs; [
    yubioath-flutter
    nixd

    unzip
    btop
    mattermost-desktop
    citrix_workspace
    openssl

    mutter
    dconf-editor
    wl-clipboard
    jabref

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
    EDITOR = "${pkgs.helix}/bin/hx";

    # For VSCodium
    ELECTRON_OZONE_PLATFORM_HINT="wayland";
  };
}

