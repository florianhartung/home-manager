{ config, pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [
    element-desktop
    mattermost-desktop
    # citrix_workspace
  ];
}
