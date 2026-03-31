{ lib, ... }:
{
  # Flattens one or more nested sets to one flat set, with new flattened keys.
  #
  # ```nix
  # { "a" = { "b" = "foo"; }, "c" = "bar"; }
  # ```
  #
  # becomes
  #
  # ```nix
  # { "a.b" = "foo"; "c" = "bar"; }
  # ```
  #
  # See: https://discourse.nixos.org/t/flatten-nested-set-to-name-value-pairs-named-after-the-old-path/59713
  flatten-nested-sets =
    set:
    let
      recurse =
        path:
        lib.concatMapAttrs (
          name: value:
          if builtins.isAttrs value then
            recurse (path ++ [ name ]) value
          else
            { ${builtins.concatStringsSep "." (path ++ [ name ])} = value; }
        );
    in
    recurse [ ] set;
}
