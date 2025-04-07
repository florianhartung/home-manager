{ pkgs, lib, firefox-addons, ... }@inputs:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      bookmarks = import ./bookmarks.nix;
      settings = import ./settings.nix inputs;
      extensions = import ./extensions.nix { inherit firefox-addons pkgs; };
      search = {
        engines = import ./search-engines.nix;
        force = true;

        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
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
