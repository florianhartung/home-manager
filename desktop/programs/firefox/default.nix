{ pkgs, lib, firefox-addons, ... }@inputs:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      # Only load bookmarks on initial setup
      # bookmarks = import ./bookmarks.nix;
      settings = import ./settings.nix inputs;
      extensions.packages = import ./extensions.nix { inherit firefox-addons pkgs; };
      search = {
        engines = import ./search-engines.nix;
        force = true;

        default = "ddg";
        privateDefault = "ddg";
      };
      userContent = ''
        @-moz-document url("about:home"), url("about:newtab") {
          main {
            justify-content: start;
          }
        }        
      '';
    };
  };
}
